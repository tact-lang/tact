struct OptionalInner {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Cell?;
}

contract OptStructTest {
    store: OptionalInner;

    init() {
        self.store = OptionalInner{ f1: null, f2: null, f3: null, f4: null };
    }
}