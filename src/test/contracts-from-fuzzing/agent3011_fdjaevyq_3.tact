struct InnerMost {
    x: Int;
    y: Bool;
}

struct Inner {
    a: InnerMost;
    b: String;
}

contract DeepNestedContract {
    data: Inner;

    init() {
        self.data = Inner{ a: InnerMost{ x:1, y:true }, b:"xyz" };
    }
}