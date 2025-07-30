contract TestContract {
    a: Int;
    b: Bool;
    c: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
    }

    receive() {
        // trivial receive to include the persistent fields
    }
}