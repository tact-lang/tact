struct StructManyOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract ManyOpts {
    data: StructManyOptionals;
    init() {
        self.data = StructManyOptionals{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}