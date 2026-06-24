struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract AllOptionalsContract {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}