struct WeirdOrder {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract StorageWeirdOrder {
    val: WeirdOrder;

    init() {
        self.val = WeirdOrder{
            a:1,
            b:null,
            c:"abc",
            d:null,
            e:true,
            f:null
        };
    }
}