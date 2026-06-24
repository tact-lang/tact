struct Combo {
    x: Int;
    y: Bool;
    z: String;
    t: Cell;
    u: Address;
    o: Int?;
    s: String?;
    c: Cell?;
    a: Address?;
    b: Bool?;
}

contract ManyTypes {
    data: Combo;

    init() {
        self.data = Combo{
            x:1, y:true, z:"abc", t:emptyCell(), u:myAddress(),
            o:null, s:null, c:null, a:null, b:null
        };
    }
}
