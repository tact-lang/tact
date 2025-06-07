struct BigData {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Slice;
    k: Int;
    l: Bool;
}

contract TestContract {
    data: BigData;

    init() {
        self.data = BigData{
            a: 1,
            b: true,
            c: "hello",
            d: null,
            e: false,
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell(),
            j: emptyCell().asSlice(),
            k: -42,
            l: true
        };
    }

    receive() {
        let q = self.data;
    }
}