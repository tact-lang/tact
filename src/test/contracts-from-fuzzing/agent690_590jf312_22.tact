struct MultiOptional {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Slice?;
    e: Address?;
    f: Bool?;
}

contract Opts {
    val: MultiOptional;

    init() {
        self.val = MultiOptional{
            a:null,
            b:null,
            c:null,
            d:null,
            e:null,
            f:null
        };
    }
}