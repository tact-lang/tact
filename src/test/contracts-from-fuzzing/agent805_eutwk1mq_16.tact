contract TestContract {
    a: Int = 111;
    b: Bool = true;
    c: Address;
    d: String;

    init() {
        self.c = myAddress();
        self.d = "init";
    }
}