struct IntOptStruct {
    x: Int?;
}

contract OptionalStructTop {
    s: IntOptStruct?;

    init() {
        self.s = IntOptStruct{ x: null };
    }
}