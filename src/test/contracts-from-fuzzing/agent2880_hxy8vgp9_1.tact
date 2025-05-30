contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Int?; // implicitly null
    
    init() {
        self.c = 42;
    }
}