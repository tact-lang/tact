struct WideOptions {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract NullableWide {
    data: WideOptions;
    init() {
        self.data = WideOptions{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}
