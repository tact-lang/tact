struct OptNested {
    x: Int;
    y: Bool?;
}

contract OptionalInsideStruct {
    data: OptNested;
    init() {
        self.data = OptNested{ x: 2, y: null };
    }
}