struct EmptyOptDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract ZeroedOptionals {
    x: EmptyOptDefaults;

    init() {
        self.x = EmptyOptDefaults{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}