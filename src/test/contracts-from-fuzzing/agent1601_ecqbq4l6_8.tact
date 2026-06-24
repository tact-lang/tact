struct Mix {
    i: Int;
    s: String;
    b: Bool;
    addr: Address;
    cl: Cell;
    slice: Slice;
    nested: Nested;
}

struct Nested {
    flag: Bool;
    s: String;
}

contract MixedStruct {
    m: Mix;
    init() {
        self.m = Mix{
            i:1, s:"x", b:true, addr:myAddress(), cl:emptyCell(), slice:emptyCell().asSlice(),
            nested: Nested{ flag:true, s:"ok" }
        };
    }
}