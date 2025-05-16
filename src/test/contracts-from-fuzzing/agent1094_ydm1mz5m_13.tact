struct S {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract MixedTypes {
    val: S;
    init() {
        self.val = S{
            a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),f:"hi",g:null,h:null,i:null
        };
    }
}