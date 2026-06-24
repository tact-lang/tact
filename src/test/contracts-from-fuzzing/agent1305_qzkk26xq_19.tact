struct TupleTest {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Cell?;
    j: Address?;
}

contract TestContract {
    storage: TupleTest;

    init() {
        self.storage = TupleTest{
            a:1,b:true,c:"str",d:emptyCell(),e:myAddress(),
            f:null,g:null,h:null,i:null,j:null
        };
    }
}