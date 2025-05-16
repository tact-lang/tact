struct NestedLots {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    a: Int;
    b: Bool;
    c: Address;
}

struct Inner2 {
    d: Cell;
    e: Slice;
}

contract MultiNested {
    x: NestedLots;

    init() {
        self.x = NestedLots{
            s1: Inner1{ a:1, b:true, c:myAddress() },
            s2: Inner2{ d: emptyCell(), e: emptyCell().asSlice() }
        };
    }
}