// Complex optional serializations
struct DeepOptionalStruct {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract TestContract {
    dos: DeepOptionalStruct;

    init() {
        self.dos = DeepOptionalStruct{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null
        };
    }
}