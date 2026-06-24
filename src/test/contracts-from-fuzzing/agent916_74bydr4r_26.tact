struct Mix {
    a: Int = 42;
    b: Int?;
    c: String? = null;
    d: Bool = false;
}

contract Test {
    saved: Mix;

    init() {
        self.saved = Mix{
            b: null,
        };
    }
}