struct LongOrder {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Int;
    h: Bool?;
    i: String;
    j: Int?;
}

contract TestContract {
    val: LongOrder;

    init() {
        self.val = LongOrder{
            a:1,
            b:true,
            c:"c",
            d:null,
            e:false,
            f:null,
            g:2,
            h:true,
            i:"str",
            j:null
        };
    }
}