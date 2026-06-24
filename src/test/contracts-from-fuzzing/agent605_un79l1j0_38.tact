struct Point {
    x: Int;
    y: Int;
}

contract OptionalInnerStruct {
    p: Point?;

    init() {
        self.p = null;
    }
}