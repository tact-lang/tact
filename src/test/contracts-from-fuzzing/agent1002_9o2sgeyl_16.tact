struct InnerA {
    one: Int;
    two: Bool;
}

struct InnerB {
    three: String;
    four: Int;
}

struct Container {
    ia: InnerA;
    ib: InnerB;
}

contract MultiNested {
    payload: Container;

    init() {
        self.payload = Container{
            ia: InnerA{ one:1, two:true },
            ib: InnerB{ three:"hi", four:2 }
        };
    }
}