struct InnerA {
    a: Int;
    b: Bool;
    c: String?;
}

struct InnerB {
    x: Cell;
    y: Address;
    z: Int?;
}

struct Outer {
    first: InnerA;
    second: InnerB;
}

contract TestContract {
    composite: Outer;
    init() {
        self.composite = Outer{
            first: InnerA{ a:1, b:true, c:null },
            second: InnerB{ x:emptyCell(), y:myAddress(), z:null }
        };
    }
}