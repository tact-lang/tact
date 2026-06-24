struct Nested {
    val: Int;
    optVal: Int?;
}

contract TestDeepOptional {
    point: Nested?;

    init() {
        self.point = null;
    }
}