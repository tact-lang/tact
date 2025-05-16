struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Layer2 {
    inner: DeepOptionals;
    d: Int?;
}

contract OptionalLayered {
    rec: Layer2;

    init() {
        self.rec = Layer2{
            inner: DeepOptionals{ a:null, b:null, c:null },
            d: null
        };
    }
}