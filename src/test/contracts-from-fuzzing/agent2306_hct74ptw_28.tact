struct Outer1 {
    inner: Inner1;
}

struct Inner1 {
    s: String;
}

contract DeepChain {
    outer: Outer1;

    init() {
        self.outer = Outer1 {
            inner: Inner1 { s: "deep again" }
        };
    }
}
