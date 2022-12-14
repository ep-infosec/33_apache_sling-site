xmlDeclaration()
urlset( xmlns:'http://www.sitemaps.org/schemas/sitemap/0.9', 'xmlns:xsi':'http://www.w3.org/2001/XMLSchema-instance', 'xsi:schemaLocation':'http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd'){
    published_content.each {content ->
        def info = includes.Git.getRevisionInfo(content.file);
        url {
            loc("${config.site_host}${config.site_contextPath}${content.uri}")
            lastmod("${info.date}")
        }
    }
}