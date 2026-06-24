struct LargeOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract ManyOpts {
    data: LargeOptionals;

    init() {
        self.data = LargeOptionals{
            a:null, b:true, c:null, d:emptyCell(), e:emptyCell().asSlice(), f:myAddress()
        };
    }
}