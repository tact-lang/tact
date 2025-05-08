struct OptionalDeep {
    a: Int?;
    b: String?;
}

struct HasOpt {
    sub: OptionalDeep?;
    flag: Bool;
}

contract NestedOptDeep {
    val: HasOpt;

    init() {
        self.val = HasOpt{
            sub: null,
            flag: true
        };
    }
}