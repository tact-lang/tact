struct LongOrder {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as uint128;
    f: Int as int257;
    g: Bool;
    h: String;
    i: Slice;
    j: Cell;
    k: Builder;
    l: Address;
}

contract LongOrderTest {
    data: LongOrder;

    init() {
        self.data = LongOrder{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
            e: 5,
            f: -1,
            g: true,
            h: "hi",
            i: emptyCell().asSlice(),
            j: emptyCell(),
            k: beginCell(),
            l: myAddress()
        };
    }
}