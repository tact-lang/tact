contract StringDefaults {
    first: String = "hello";
    second: String = "";
    third: String;
    
    init() {
        self.third = "another";
    }
}