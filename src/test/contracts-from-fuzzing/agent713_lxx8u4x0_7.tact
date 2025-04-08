struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Builder;
    g: Address;
    h: String?;
    i: Int?;
    j: Bool?;
}

contract WideTypesTest {
    val: Wide;

    init() {
        self.val = Wide{
            a:1, b:true, c:"hi", d:emptyCell(), e:emptyCell().asSlice(),
            f:beginCell(), g:myAddress(), h:null, i:null, j:null
        };
    }
}