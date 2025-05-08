struct Nullable {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract OptionalFields {
    n: Nullable;

    init() {
        self.n = Nullable {
            a:null, b:true, c:null, d:emptyCell(), e:null, f:null
        };
    }
}