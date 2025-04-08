struct StrangeOrder {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract TestContract {
    s: StrangeOrder = StrangeOrder{
        a:1, b:null, c:"q", d:null, e:true, f:null
    };
}
