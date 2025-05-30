struct S {
    bigStr: String;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{ bigStr: "a very very very very very very very very very very very very very very very very very long string" };
    }
}