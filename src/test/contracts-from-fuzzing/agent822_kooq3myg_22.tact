// test receiver assigns optional persistent fields
contract TestContract {
    f: Int?;

    init() {
        self.f = null;
    }

    receive() {
        self.f = 42;
    }
}
