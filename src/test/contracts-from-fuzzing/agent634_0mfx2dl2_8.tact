struct MultiOption {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract TestContract {
    data: MultiOption;
    
    init() {
        self.data = MultiOption{a:null, b:null, c:null, d:null, e:null, f:null, g:null};
    }
}
