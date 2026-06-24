struct Alpha {
    p: Int?;
    q: Bool;
}

struct Beta {
    x: String?;
    y: Int;
}

contract TestContract {
    a: Alpha;
    b: Beta;

    init() {
        self.a = Alpha{ p: null, q: true };
        self.b = Beta{ x: "hi", y: 99 };
    }
}