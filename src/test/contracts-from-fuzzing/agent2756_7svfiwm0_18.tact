struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

struct Container {
    inner: BigNested;
    another: Int;
}

contract NestedBig {
    data: Container;
    
    init() {
        self.data = Container{
            inner: BigNested{
                a:1, b:true, c:"x", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice()
            },
            another: 42
        };
    }
}