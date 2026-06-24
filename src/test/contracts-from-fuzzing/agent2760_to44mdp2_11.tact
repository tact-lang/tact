struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
    j: Int;
    k: Address;
    l: Cell;
}

contract ManyInits {
    f1: S;
    f2: S;

    init() {
        self.f1 = S{
            a: 1, b:true, c:"a", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress(), g:null, h:false, i:"x", j:123, k:myAddress(), l:emptyCell() };
        self.f2 = S{
            a: 10, b:false, c:"b", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress(), g:100, h:true, i:"z", j:321, k:myAddress(), l:emptyCell() };
    }
}