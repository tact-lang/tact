struct S {
    x: Int;
    y: Bool;
}

contract OptionalStruct {
    data: S?;

    init() {
        self.data = S{
            x: 7,
            y: false
        };
    }
}