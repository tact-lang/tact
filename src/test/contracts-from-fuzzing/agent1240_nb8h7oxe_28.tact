// many empty optional fields, combined null
struct EmptyMany {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract AllNull {
    data: EmptyMany;
    init() {
        self.data = EmptyMany{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}