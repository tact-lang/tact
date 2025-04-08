contract TestStorage {
    flag: Bool; 
    count: Int;
    text: String;
    bigNumber: Int as uint128;
    optInt: Int?;
    
    init() {
        self.flag = true;
        self.count = 42;
        self.text = "hello";
        self.bigNumber = 123456789012345678901234567890;
        self.optInt = null;
    }
}