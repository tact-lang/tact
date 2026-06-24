contract TestStorage {
    i1: Int = 1;
    i2: Int? = null;
    b1: Bool = true;
    b2: Bool = false;
    s: String = "hi";
    a: Address;

    init() {
        self.a = myAddress();
    }

    receive() {
        let a = self.a;
    }
}