struct OptionalMix {
    s: String;
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestContract {
    data: OptionalMix;
    init() {
        self.data = OptionalMix{
            s: "Hello",
            a: 42,
            b: null,
            c: null
        };
    }
}