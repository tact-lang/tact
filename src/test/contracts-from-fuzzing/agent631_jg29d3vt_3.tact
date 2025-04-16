struct Coord { x: Int; y: Int }

contract Test {
    a: Int = 1;
    b: Int as int64 = 2;
    c: Bool = true;
    d: Bool = false;
    e: Address? = null;
    f: Cell? = null;
    g: String = "hi";
    h: Coord = Coord{ x: 0, y: 1 };
    i: Int as uint8 = 5;
    j: Coord = Coord{ x: 1, y: 2 };
    k: Int = 42;
    l: Bool = false;
    m: Coord = Coord{ x: 2, y: 3 };
    n: Bool? = true;
    o: String = "test";

    init() {
        self.a = 100;
    }

    receive() {}
}