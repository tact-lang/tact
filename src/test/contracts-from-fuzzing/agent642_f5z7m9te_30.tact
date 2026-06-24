// Large optional filled struct with many fields
struct LargeOptFields {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: Bool?;
    e: Cell?;
    f: Cell?;
    g: String?;
    h: String?;
    i: Slice?;
    j: Slice?;
}

contract TestContract {
    persist: LargeOptFields;

    init() {
        self.persist = LargeOptFields{
            a:null,b:null,c:null,d:null,e:null,f:null,g:null,h:null,i:null,j:null
        };
    }
}