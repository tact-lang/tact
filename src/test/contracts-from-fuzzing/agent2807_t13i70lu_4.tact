struct Point {
    x: Int;
    y: Int;
}

contract NestedOptionalStruct {
    val: Point?;
    init() {
        self.val = null;
    }
}