struct Container {
    i: Int;
    payload: Slice as remaining;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{ i: 5, payload: "".asComment().asSlice() };
    }
}