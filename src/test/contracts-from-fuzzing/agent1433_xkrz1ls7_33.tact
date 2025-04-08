struct MixOrder {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Address;
    h: Cell?;
}

contract TestContract {
    m: MixOrder;
    init() {
        self.m = MixOrder{
            a:1, b:true, c:"x", d:null, e:false, f:null, g:myAddress(), h:emptyCell()
        };
    }
}