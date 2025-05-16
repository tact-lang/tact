struct Annoying {
    a: Int;
    b: String;
    c: Int?;
    d: Bool;
    e: String?;
    f: Address;
    g: Cell;
    h: Bool?;
    i: Int as uint8;
}

contract TestContract {
    annoying: Annoying;
    init() {
        self.annoying = Annoying{
            a:10, b:"hi", c:null, d:true, e:"foo", f:myAddress(), g:emptyCell(), h:false, i:255
        };
    }
}