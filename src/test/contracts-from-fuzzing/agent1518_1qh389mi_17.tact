struct S {
    f: Int;
}

contract Redefault {
    field: S?;

    init() {
        self.field = null;
    }
}