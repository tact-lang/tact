struct Inner {
    flag: Bool;
    val: Int?;
}

struct Middle {
    s: String;
    inner: Inner;
}

struct Outer {
    address: Address;
    cellData: Cell;
    middle: Middle;
}

contract DeepNested {
    deep: Outer;

    init() {
        self.deep = Outer{
            address: myAddress(),
            cellData: emptyCell(),
            middle: Middle{
                s: "deep",
                inner: Inner{
                    flag: true,
                    val: null,
                },
            },
        };
    }
}