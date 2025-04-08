message(1) Ping {}

struct Coord {
    x: Int;
    y: Int;
}

contract ManyKinds {
    iv: Int = 5;
    bv: Bool = true;
    addr: Address;
    cl: Cell;
    s: String = "s";
    coord: Coord;
    pongOpt: Ping?;

    init() {
        self.addr = myAddress();
        self.cl = emptyCell();
        self.coord = Coord{ x:0, y:0 };
        self.pongOpt = null;
    }
}
