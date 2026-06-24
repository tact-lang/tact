contract ManyStrings {
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
    
    init() {
        self.s1 = "one";
        self.s2 = null;
        self.s3 = "three";
        self.s4 = null;
    }
}