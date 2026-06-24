struct Inner {
    x: Int;
    y: Bool;
    name: String;
}

contract SingleNestedStruct {
    pos: Inner;

    init() {
        self.pos = Inner{
            x: 5,
            y: true,
            name: "test"
        };
    }
}