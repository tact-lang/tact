struct Alternating {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Cell?;
}

contract TestContract {
    data: Alternating;

    init() {
        self.data = Alternating{
            a:1, b:null, c:true, d:null, e:myAddress(), f:null, g:emptyCell(), h:null
        };
    }
}