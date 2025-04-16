struct S {
    txt: String;
}

contract EmptyThenAssign {
    data: S;

    init() {
        self.data = S{ txt: "test" };
    }
}