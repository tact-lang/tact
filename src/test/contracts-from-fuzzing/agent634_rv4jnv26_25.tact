// Contract with a large nested structure with 10+ fields
struct BigStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool;
    e: Int;
    f: String;
    g: Bool?;
    h: Int?;
    i: String?;
    j: Cell;
    k: Address;
}

contract NestedBigStruct {
    container: BigStruct;

    init() {
        self.container = BigStruct{
            a:1, b:2, c:true, d:false, e:5, f:"hi",
            g:null, h:null, i:null, j:emptyCell(), k:myAddress()
        };
    }
}