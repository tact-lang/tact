struct MultipleOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
    f: Address?;
}

contract MultiOptionals {
    data: MultipleOptionals;
    init() {
        self.data = MultipleOptionals{
            a:null, b:null, c:null, d:null,
            e:null, f:null
        };
    }
}
