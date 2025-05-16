struct S {
    x: Int = 5;
}

contract OverwriteDefault {
    data: S;

    init() {
        self.data = S{ x: 42 };
    }
}