struct NestedOptional {
    x: Int?;
    y: Bool?;
}

struct OuterOptional {
    inner: NestedOptional?;
    label: String?;
}

contract TestContract {
    s: OuterOptional;

    init() {
        self.s = OuterOptional{
            inner: null,
            label: null,
        };
    }

    receive() {
        let _ = self.s.inner;
    }
}