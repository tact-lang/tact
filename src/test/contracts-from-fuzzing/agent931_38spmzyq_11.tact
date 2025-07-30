struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
}

contract HugeStructContract {
    bs: BigStruct;

    init() {
        self.bs = BigStruct{
            a:1, b:true, c:"X", d:null, e:null, f:null, g:myAddress(), h:null, i:emptyCell(), j:null
        };
    }
}