struct DeepInner {
    a: Int?;
    b: Bool;
}

struct MiddleLayer {
    rec: DeepInner;
    text: String;
}

contract Encompass {
    st: MiddleLayer;

    init() {
        self.st = MiddleLayer{
            rec: DeepInner{ a: null, b: true },
            text: "abc",
        };
    }
}