struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct BigStruct {
    first: A;
    second: B;
    third: C;
}

contract BigPersistent {
    store: BigStruct;

    init() {
        self.store = BigStruct{
            first: A{x:0},
            second: B{y:0},
            third: C{z:0}
        };
    }
}