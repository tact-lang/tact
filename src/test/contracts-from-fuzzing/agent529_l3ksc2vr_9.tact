struct MultiNested {
    i: Int;
    inner1: Inner1;
    
}

struct Inner1 {
    b: Bool;
    s: String;
    inner2: Inner2;
}

struct Inner2 {
    optB: Bool?;
    inner3: Inner3;
}

struct Inner3 {
    addr: Address;
    slice: Slice;
}

contract ComplexNested {
    m: MultiNested;

    init() {
        self.m = MultiNested{
            i: 7,
            inner1: Inner1{
                b: true,
                s: "X",
                inner2: Inner2{
                    optB: null,
                    inner3: Inner3{
                        addr: myAddress(),
                        slice: emptyCell().asSlice()
                    }
                }
            }
        };
    }
}