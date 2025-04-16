contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address; // no default
    d: String = "hello";

    init() {
        self.c = myAddress();
    }
}