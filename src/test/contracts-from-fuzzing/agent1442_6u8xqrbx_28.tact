// minimal contract with large nested default struct
struct DefInner {
    a: Int = 1;
    b: Bool = true;
    c: String = "str";
}

struct DefOuter {
    x: DefInner = DefInner{};
}

contract TestContract {
    d: DefOuter;
    init() {
        self.d = DefOuter{};
    }
}