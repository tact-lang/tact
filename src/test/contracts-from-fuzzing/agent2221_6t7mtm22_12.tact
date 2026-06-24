contract PartiallyDefaulted {
    a: Int; // uninitialized must be set in init
    b: Bool = false;

    init() {
        self.a = 42; 
    }
}
