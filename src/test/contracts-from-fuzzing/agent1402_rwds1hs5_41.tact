struct HasTrailing {
    name: String;
    rest: Slice as remaining;
}

contract RestTrailing {
    a: HasTrailing;

    init() {
        self.a = HasTrailing{ name: "name", rest: emptyCell().asSlice() };
    }
}