struct S {
    text: String?;
}

contract OptString {
    s: S;

    init() {
        self.s = S{text: null};
    }
}