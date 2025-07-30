struct ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Slice?;
    e: Cell?;
}

contract ContractManyOptionals {
    val: ManyOptionals = ManyOptionals{
        a:null, b:null, c:null, d:null, e:null
    };

    init() {
        self.val = ManyOptionals{
            a:5, b:true, c:"s", d:null, e:null
        };
    }
}