contract TestContract {
    a: Int; 

    init() {
        self.a = 1;
    }

    get fun get_a(): Int {
        return self.a;
    }
}