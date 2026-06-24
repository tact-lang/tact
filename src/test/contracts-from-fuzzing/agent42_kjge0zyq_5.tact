struct Details {
    flag: Bool?;
    note: String;
}

struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: String;
    h: Int?;
    i: Bool?;
    j: Details?;
}

contract LargeStructTest {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a:1, b:true, c:"c", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(), g:"g",
            h:null, i:null, j:null,
        };
    }
}