struct OptionalInt {
    val: Int?;
}

struct WrapOptional {
    opt: OptionalInt;
}

contract WrapNestedOptionals {
    f: WrapOptional;
    init() {
        self.f = WrapOptional{ opt: OptionalInt{ val: null } };
    }
}
