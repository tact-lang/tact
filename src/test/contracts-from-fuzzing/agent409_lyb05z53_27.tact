struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Address?;
}

contract Opts {
    data: MultipleOptionals;

    init() {
        self.data = MultipleOptionals{
            a:null,
            b:null,
            c:null,
            d:null,
            e:null,
            f:null,
            g:null
        };
    }
}