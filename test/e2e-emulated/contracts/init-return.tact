contract Test {
    a: Int;
    
    init() {
        self.a = 123;
        return;
    }

    receive () {}

    get fun a(): Int {
        return self.a;
    }
}