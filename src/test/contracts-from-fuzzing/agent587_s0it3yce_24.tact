struct OptionalStruct {
    a: Int?;
}

contract OptionalStructStorage {
    s: OptionalStruct?;
    init() {
        self.s = OptionalStruct{ a: null };
    }
    receive() {
        if (self.s != null) {
            let _ = self.s!!;
        }
    }
}