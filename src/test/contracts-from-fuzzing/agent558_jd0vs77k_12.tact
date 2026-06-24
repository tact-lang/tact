struct S {
    id: Int;
}

contract OptionalBugTest {
    data: S?;

    init() {
        self.data = S{ id: 123 };
    }
}