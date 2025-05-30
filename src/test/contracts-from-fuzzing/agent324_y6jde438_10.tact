contract EmptyStringsNulls {
    str1: String?;
    str2: String;
    str3: String?;
    
    init() {
        self.str1 = null;
        self.str2 = "";
        self.str3 = null;
    }
}