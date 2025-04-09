struct OptionalComposite {
    s: String?;
    addr: Address?;
    n: Int?;
    b: Bool?;
}

contract OptionalCompositeTest {
    data: OptionalComposite;

    init() {
        self.data = OptionalComposite{ s: null, addr: null, n: null, b: null };
    }
}