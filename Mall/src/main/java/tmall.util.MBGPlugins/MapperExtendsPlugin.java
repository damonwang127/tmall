package tmall.util.MBGPlugins;

import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;
import org.mybatis.generator.api.dom.java.FullyQualifiedJavaType;
import org.mybatis.generator.api.dom.java.Interface;
import org.mybatis.generator.api.dom.java.TopLevelClass;
import org.mybatis.generator.internal.util.StringUtility;

import java.util.List;
import java.util.Properties;
import java.util.Set;

/**
 * 使Mapper继承BaseMapper
 */
public class MapperExtendsPlugin extends PluginAdapter {
    private Set<String> mappers;

    @Override
    public void setProperties(Properties properties) {
        super.setProperties(properties);
        String mappers = this.properties.getProperty("mappers");
        if (StringUtility.stringHasValue(mappers)) {
            for(String mapper:mappers.split(",")) {
                this.mappers.add(mapper);
            }
        } else {
            throw new RuntimeException("Mapper插件缺少必要的mappers属性");
        }
    }

    @Override
    public boolean clientGenerated(Interface interfaze, TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        FullyQualifiedJavaType entityType = new FullyQualifiedJavaType(introspectedTable.getBaseRecordType());
        FullyQualifiedJavaType exampleType = new FullyQualifiedJavaType(introspectedTable.getExampleType());
        for(String mapper:mappers){
            interfaze.addImportedType(new FullyQualifiedJavaType(mapper));
            interfaze.addSuperInterface(new FullyQualifiedJavaType(mappers+"<"+entityType.getShortName()+","+
                    exampleType.getShortName()+">"));
        }
        return true;
    }

    @Override
    public boolean validate(List<String> list) {
        return true;
    }
}
