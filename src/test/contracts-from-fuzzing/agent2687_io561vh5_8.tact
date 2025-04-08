struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int?;
    g: Bool?;
    h: String;
    i: Int;
    j: Address;
}

contract LargeStructStorage {
    ls: LargeStruct;

    init() {
        self.ls = LargeStruct{
            a:1, b:true, c:"s", d:emptyCell(), e:myAddress(),
            f:null, g:null, h:"h", i:42, j:myAddress()
        };
    }
}