contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";
    d: Address; 

    init() {
        self.d = sender();
    }
}