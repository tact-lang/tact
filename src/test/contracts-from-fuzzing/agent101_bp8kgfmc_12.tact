struct S {
    s: String?;
}

contract OptionalString {
    data: S = S{ s: null };

    init() {
        self.data = S{ s: "" };
    }
}