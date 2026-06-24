struct NullOpt {
    x: Int?;
    y: String?;
    z: Bool?;
    a: Slice?;
    b: Cell?;
    c: Address?;
}

contract NullsEverywhere {
    d: NullOpt;
    init() {
        self.d = NullOpt{
            x: null,
            y: null,
            z: null,
            a: null,
            b: null,
            c: null
        };
    }
}
