struct MixedOptional {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: Int;
}

contract TestContract {
    val: MixedOptional;

    init() {
        self.val = MixedOptional{
            a: null,
            b: true,
            c: null,
            d: null,
            e: 123
        };
    }
}