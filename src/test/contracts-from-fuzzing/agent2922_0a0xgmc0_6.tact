struct DeepOptional {
    nestedOpt: LongNested?;
    flag: Bool;
}

struct LongNested {
    a: Int;
    b: String;
    c: Bool;
    d: Slice;
    e: Address;
    f: Cell;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Slice?;
    k: Address?;
    l: Cell?;
}

contract TestContract {
    data: DeepOptional;

    init() {
        self.data = DeepOptional {
            nestedOpt: null,
            flag: true
        };
    }
}