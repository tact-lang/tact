contract TestContract {
    a: Int;
    b: Int?;

    init() {
        self.a = 42;
        self.b = null;
    }
    
    get fun getA(): Int {
        return self.a;
    }
    
    get fun getB(): Int? {
        return self.b;
    }
}