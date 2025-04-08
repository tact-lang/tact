contract ContractOptInt {
    a: Int?;

    init() {
        self.a = null;
    }
    
    get fun getA(): Int? {
        return self.a;
    }
}