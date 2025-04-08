struct DeepMany {
    a: Int;
    b: Bool;
    c: Bool?;
    d: Int?;
}

contract NestedDeepMix {
    data: DeepMany;

    init() {
        self.data = DeepMany{
            a: 10,
            b: false,
            c: null,
            d: null
        };
    }
}