struct Massive {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Bool?;
    h: Int?;
    i: Slice;
    j: Address;
}

contract TestContract {
    m: Massive;
    init() {
        self.m = Massive{
            a:1,b:true,c:myAddress(),d:emptyCell(),e:emptyCell().asSlice(),
            f:"test",g:null,h:null,i:emptyCell().asSlice(),j:myAddress()
        };
    }
}