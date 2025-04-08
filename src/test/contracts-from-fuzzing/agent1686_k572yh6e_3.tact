struct Deep {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Address;
    e: Slice;
}

struct Outer {
    first: Deep;
    second: Deep;
    third: Deep;
}

contract LotsOfNested {
    agg: Outer;

    init() {
        self.agg = Outer{
            first: Deep{
                d: myAddress(),
                e: emptyCell().asSlice(),
            },
            second: Deep{
                a: 42,
                b: false,
                c: "world",
                d: myAddress(),
                e: emptyCell().asSlice(),
            },
            third: Deep{
                d: myAddress(),
                e: emptyCell().asSlice(),
            }
        };
    }
}