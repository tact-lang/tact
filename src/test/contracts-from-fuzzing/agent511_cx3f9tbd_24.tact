contract EmptyInit {
}

contract FieldsOnly {
    a: Int;
    b: Int;
    c: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
    }
}

contract ParamsOnly(
    x: Int,
    y: Int
) {}

contract ParamsNoInit(
    x: Int
) // not using explicit init
{}