struct OnlyBool {
    f: Bool;
}

contract OptionalWrap {
    x: OnlyBool?;

    init() {
        self.x = OnlyBool{f:true};
    }
}
