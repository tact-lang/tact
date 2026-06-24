struct BigContractData {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Cell?;
    k: Slice?;
    l: Address?;
    m: InnerStruct;
    n: OptionalInner?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

struct OptionalInner {
    foo: Int;
    bar: Bool;
}

contract TestContract {
    data: BigContractData;

    init() {
        self.data = BigContractData{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: false,
            i: null,
            j: emptyCell(),
            k: emptyCell().asSlice(),
            l: myAddress(),
            m: InnerStruct { x: 42, y: false },
            n: OptionalInner { foo: 99, bar: true }
        };
    }
}