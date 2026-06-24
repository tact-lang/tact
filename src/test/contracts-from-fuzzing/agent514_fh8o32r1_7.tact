struct LargeOptionals {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: Bool?;
}

contract LargeOptionalContract {
    data: LargeOptionals;
    init() {
        self.data = LargeOptionals{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}