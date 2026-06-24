struct S {
    val: Int?;
}

contract Test {
    data: S;

    init() {
        self.data = S{ val: null };
    }
}