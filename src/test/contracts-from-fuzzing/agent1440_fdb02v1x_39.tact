struct OuterR {
    sub: InnerR;
}

struct InnerR {
    addr: Address;
    sliceOpt: Slice?;
    cellOpt: Cell?;
    txt: String;
}

contract ComplexPersistence {
    thing: OuterR;

    init() {
        self.thing = OuterR{
            sub: InnerR{
                addr: myAddress(),
                sliceOpt: null,
                cellOpt: emptyCell(),
                txt: "hi"
            }
        };
    }
}