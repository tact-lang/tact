// Many optional fields mixing primitive and complex
struct Inner {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract TestContract {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Inner;

    init() {
        self.d = Inner{f1: null, f2: null, f3: null};
    }
}