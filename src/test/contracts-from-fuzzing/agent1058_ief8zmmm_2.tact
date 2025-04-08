struct BigStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Bool;
    h: Cell;
    i: Address;
    j: Slice;
    k: String;
    l: Bool?;
    m: Cell?;
    n: Address?;
    o: Slice?;
    p: String?;
}

contract TestContract {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a: 1, b:2, c:3, d:4, e:5, f:6, g:true, h:emptyCell(),
            i: myAddress(), j: emptyCell().asSlice(), k: "str",
            l: null, m: null, n: null, o: null, p: null
        };
    }
}