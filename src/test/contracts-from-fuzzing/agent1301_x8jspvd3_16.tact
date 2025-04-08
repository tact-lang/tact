struct MultiOption {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract TestContract {
    m: MultiOption;
    init() {
        self.m = MultiOption{
            a:null,b:null,c:null,d:null,e:null,f:null
        };
    }
}