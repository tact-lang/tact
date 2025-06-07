contract ContractDefaults {
    val1: Int = 123;
    val2: Bool = true;
    val3: String = "hello";
    val4: Int? = null;
    val5: Bool? = null;
    val6: String? = null;
    
    init() {
        self.val1 = 1;
        self.val2 = false;
        self.val3 = "bye";
        self.val4 = null;
        self.val5 = null;
        self.val6 = null;
    }
}