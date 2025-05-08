struct SerialOpt {
    a: Int?;
    b: Bool?;
}

struct WrapOpt {
    opt: SerialOpt?;
}

contract NestedOptionalStructs {
    val: WrapOpt;

    init() {
        self.val = WrapOpt{ opt: null };
    }
}