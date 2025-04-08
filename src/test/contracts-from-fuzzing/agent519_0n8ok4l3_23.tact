struct Larger {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
}

contract BiggerNestedTest {
    data: Larger;

    init() {
        self.data = Larger{
            a:1,b:true,c:"hi",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(),g:null,h:null,i:null,j:null
        };
    }
}