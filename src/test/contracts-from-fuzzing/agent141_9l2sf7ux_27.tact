struct NestedMore {
    a: Int;
    sub: Sub?;
}

struct Sub {
    b: Bool?;
    str: StringHolder;
}

struct StringHolder {
    s: String;
}

contract ComboMixOpt {
    m: NestedMore;

    init() {
        self.m = NestedMore{
            a: 11,
            sub: Sub{
                b: null,
                str: StringHolder{ s: "yo" }
            }
        };
    }
}