struct InnerBool {
    x: Bool;
    y: Bool;
}

contract BoolStruct {
    s: InnerBool;

    init() {
        self.s = InnerBool{ x: true, y: false };
    }
}