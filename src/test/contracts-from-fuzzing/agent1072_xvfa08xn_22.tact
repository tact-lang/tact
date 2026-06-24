struct DefInner {
    x: Int = 5;
}
struct DefOuter {
    i: DefInner = DefInner{};
}

contract StructDefaults {
    s: DefOuter;

    init() {
        self.s = DefOuter{};
    }
}