struct NestedData {
    score: Int as uint16;
    tag: String = "tagged";
}

struct Complex {
    title: String;
    active: Bool = false;
    value: Int as uint32;
    nested: NestedData;
    metadata: String? = null;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex{
            title: "hi",
            value: 100,
            nested: NestedData{ score: 55 }
        };
    }
}