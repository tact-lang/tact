contract ContractDefault {
    a: Int = 5;
    b: Bool = true;
    c: String = "yo";
    
    init() {
        self.a = 10;
        self.b = false;
        self.c = "updated";
    }
}
