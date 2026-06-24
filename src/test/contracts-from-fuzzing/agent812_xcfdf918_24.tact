struct StructWithManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Address?;
}

contract ManyOptionals {
    data: StructWithManyOpts;

    init() {
        self.data = StructWithManyOpts{
            a:null, b:true, c:"hi", d:null, e:myAddress()
        };
    }
}