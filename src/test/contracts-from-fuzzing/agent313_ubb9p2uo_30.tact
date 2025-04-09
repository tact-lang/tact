struct MultiLayer {
    x: Int;
    y: Bool;
    sub: Layer2;
}

struct Layer2 {
    p: String?;
    q: Bool;
    r: Layer3;
}

struct Layer3 {
    a: Int;
    b: String;
}

contract DeepLayersTest {
    store: MultiLayer;

    init() {
        self.store = MultiLayer{
            x: 1,
            y: true,
            sub: Layer2{
                p: null,
                q: false,
                r: Layer3{ a: 42, b: "deep" }
            }
        };
    }
}