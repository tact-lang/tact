// Persistent nested optional structs, test null in nested optional
struct DeepInner {
    foo: Int;
}

struct MiddleOpt {
    inner: DeepInner?;
}

contract TestContract {
    midopt: MiddleOpt?;

    init() {
        self.midopt = MiddleOpt{
            inner: null
        };
    }
}