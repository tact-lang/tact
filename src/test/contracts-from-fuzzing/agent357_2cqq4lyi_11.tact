struct Chain3 {
    a: Int;
    b: Inner1;
}

struct Inner1 {
    c: Bool;
    d: Inner2;
}

struct Inner2 {
    e: String;
    f: Address;
    g: Inner3;
}

struct Inner3 {
    h: Slice;
    i: Cell;
}

contract MultiLevelChain {
    data: Chain3;

    init() {
        self.data = Chain3{
            a:1,
            b: Inner1{
                c:true,
                d: Inner2{
                    e: "hi",
                    f: myAddress(),
                    g: Inner3{
                        h: emptyCell().asSlice(),
                        i: emptyCell(),
                    },
                },
            },
        };
    }
}