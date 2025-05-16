// optional nested struct with defaults initialized
struct InnerD {
    x: Int = 7;
    b: Bool = true;
}

struct OuterD {
    inner: InnerD? = null;
    msg: String = "hello";
}

contract OptNestDefaults {
    state: OuterD;

    init() {
        self.state = OuterD{};
    }
}