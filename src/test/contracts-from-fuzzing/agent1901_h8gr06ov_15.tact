struct MixedPrimitives {
    a: Int = 1;
    b: Int?;
    c: Bool = false;
    d: Bool?;
    e: Address?;
    f: String = "str";
    g: String?;
    h: Cell?;
    i: Slice?;
}

contract AssignInInit {
    state: MixedPrimitives;

    init() {
        self.state = MixedPrimitives{};
        self.state.h = emptyCell();
        self.state.i = emptyCell().asSlice();
    }
}