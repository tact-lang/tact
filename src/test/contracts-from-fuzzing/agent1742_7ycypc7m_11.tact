struct S {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
}

contract SeveralStructs {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{a:1,b:true,c:myAddress(),d:"X",e:emptyCell(),f:emptyCell().asSlice()};
        self.s2 = S{a:2,b:false,c:myAddress(),d:"Y",e:emptyCell(),f:emptyCell().asSlice()};
    }
}