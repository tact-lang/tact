struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int;
    h: Bool;
    i: String;
    j: Address;
    k: Cell;
    l: Slice;
}

contract ManyFields {
    s1: LargeStruct;
    s2: LargeStruct;
   
    init() {
        self.s1 = LargeStruct{ a:0,b:true,c:"a",d:myAddress(),e:emptyCell(),f:emptyCell().asSlice(), g:1,h:false,i:"b",j:myAddress(),k:emptyCell(),l:emptyCell().asSlice() };
        self.s2 = self.s1;
    }
}