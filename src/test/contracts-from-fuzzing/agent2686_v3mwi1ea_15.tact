struct OptionalDeep {
    a: Int?;
    s: String?;
}

struct Container {
    od: OptionalDeep?;
    flag: Bool;
}

contract OptInDeep {
    val: Container;

    init() {
        self.val = Container{
            od: OptionalDeep{ a:null, s:"s" },
            flag: false
        };
    }
}
