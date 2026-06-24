struct LargeOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract LargeOptContract {
    s: LargeOptional;

    init() {
        self.s = LargeOptional{
            a:null, b:null, c:null,
            d:null, e:null, f:null
        };
    }
}