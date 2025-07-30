struct LargeNested {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Int;
    h: Bool;
    i: String;
}

struct TopLevel {
    inner1: LargeNested;
    inner2: LargeNested;
    count: Int;
}

contract VeryWide {
    payload: TopLevel;
    init() {
        self.payload = TopLevel{
            inner1: LargeNested{
                a:0, b:true, c:"hi", d:myAddress(), e:emptyCell().asSlice(), f:emptyCell(), g:1, h:false, i:"foo",
            },
            inner2: LargeNested{
                a:2, b:false, c:"bar", d:myAddress(), e:emptyCell().asSlice(), f:emptyCell(), g:3, h:true, i:"baz",
            },
            count: 42,
        };
    }
}