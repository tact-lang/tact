struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: String?;
    e: Address?;
    f: Slice?;
}

contract AllOptionals {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}