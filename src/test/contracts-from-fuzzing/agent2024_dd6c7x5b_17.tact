struct S4 {
    x: Int;
    y: String;
}

contract OptionalOuterStruct {
    data: S4?;

    init() {
        self.data = null;
    }
}