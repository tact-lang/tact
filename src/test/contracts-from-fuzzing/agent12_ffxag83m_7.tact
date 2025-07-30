struct OptionalDeep {
    s: String?;
    n: Int?;
    b: Bool?;
}

contract OptNested {
    val: OptionalDeep?;

    init() {
        self.val = OptionalDeep{
            s: null,
            n: null,
            b: null
        };
    }
}
