// struct containing another struct with default values
struct InnerDefault {
    a: Int = 100;
    b: Bool = false;
}

struct OuterWrap {
    d: InnerDefault;
}

contract StructDefaults {
    s: OuterWrap;

    init() {
        self.s = OuterWrap{
            d: InnerDefault{} // use defaults
        };
    }
}