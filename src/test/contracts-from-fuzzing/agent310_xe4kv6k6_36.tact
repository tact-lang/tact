struct S {
    flag: Bool?;
}

contract OptionalBoolTest {
    s: S;
    init() {
        self.s = S{flag: null};
    }
}