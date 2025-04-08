struct S {
    f1: Int as uint8;
    f2: Int as int64;
    f3: Bool;
    f4: String?;
    f5: Address;
}

contract TestContract {
    storage: S;

    init() {
        self.storage = S{
            f1: 255,
            f2: -123456789,
            f3: true,
            f4: null,
            f5: myAddress(),
        };
    }

    receive() {
        let _ = self.storage.f3;
    }
}