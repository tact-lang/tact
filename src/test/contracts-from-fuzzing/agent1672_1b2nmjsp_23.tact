// Struct with lots of optionals on basic fields
struct LotsOpt {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: Bool?;
    g: Bool?;
    h: Address?;
    i: Address?;
    j: Cell?;
    k: Cell?;
    l: String?;
    m: String?;
}

contract TestContract {
    lo: LotsOpt;
    init() {
        self.lo = LotsOpt{
            a:null,b:1,c:2,d:null,
            e:true,f:null,g:false,
            h:myAddress(),i:null,
            j:null,k:emptyCell(),
            l:null,m:"ok"
        };
    }
}