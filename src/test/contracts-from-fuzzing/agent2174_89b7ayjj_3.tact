struct OptionalDeep {
    sub: Inner?;
}

struct Inner {
    deeper: Innermost?;
}

struct Innermost {
    flag: Bool;
    val: Int;
}

contract OptNested {
    data: OptionalDeep;
    init() {
        self.data = OptionalDeep{
            sub: Inner{
                deeper: null
            }
        };
    }
}
