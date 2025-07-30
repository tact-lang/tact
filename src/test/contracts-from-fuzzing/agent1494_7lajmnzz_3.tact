struct BigStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Bool;
    f: Address;
    g: Int;
    h: String;
    i: Cell;
    j: Slice;
}

contract WideFields {
    storing: BigStruct;
    init() {
        self.storing = BigStruct{
            a:1, b:2, c:true, d:"x", e:false, f:myAddress(),
            g:3, h:"y", i:emptyCell(), j:emptyCell().asSlice()
        };
    }
}