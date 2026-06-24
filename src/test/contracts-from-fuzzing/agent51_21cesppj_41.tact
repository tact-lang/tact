struct WeirdOptionalOrdering {
    a: Int?;
    x: Int;
    b: Bool?;
    y: Bool;
    c: String?;
    z: String;
}

contract WeirdOrderOpt {
    val: WeirdOptionalOrdering;

    init() {
        self.val = WeirdOptionalOrdering{
            a:null, x:42, b:null, y:true, c:null, z:"ok"
        };
    }
}