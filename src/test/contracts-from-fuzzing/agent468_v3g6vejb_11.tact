struct MixNestedOptional {
    a: Int?;
    b: Inner?;
}

struct Inner {
    x: Int;
    y: String?;
}

contract TestContract {
    test: MixNestedOptional;

    init() {
        self.test = MixNestedOptional{
            a: null,
            b: Inner{ x: 10, y: null }
        };
    }
}