struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Bool?;
    h: Int?;
    i: String;
    j: Cell;
    k: Address;
    l: Slice;
}

contract TestContract {
    data: S;

    init() {
        self.data = S {
            a:1,b:true,c:"s",d: emptyCell(),e:myAddress(),
            f:emptyCell().asSlice(),g:null,h:null,i:"x",j:emptyCell(),k:myAddress(),l:emptyCell().asSlice()
        };
    }
}