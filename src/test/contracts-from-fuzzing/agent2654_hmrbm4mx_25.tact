struct FiveOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract StructWithManyOptionals {
    x: FiveOpt;

    init() {
        self.x = FiveOpt{
            a:null,
            b:null,
            c:null,
            d:null,
            e:null
        };
    }
}