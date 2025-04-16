struct Flat {
    x: Int;
    y: Int;
}

contract OptionalStruct {
    maybe: Flat?;

    init() {
        self.maybe = Flat{ x:1, y:2 };
    }
}
