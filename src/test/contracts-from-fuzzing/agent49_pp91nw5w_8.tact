struct OptionalDeep {
    inner: Int?;
}

struct WrapOpt {
    nested: OptionalDeep?;
}

contract MultiMaybe {
    val: WrapOpt;

    init() {
        self.val = WrapOpt{nested: null};
    }
}