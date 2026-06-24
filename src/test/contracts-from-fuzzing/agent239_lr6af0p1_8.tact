struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract ManyOptionalsContract {
    complex: MultiOptional;

    init() {
        self.complex = MultiOptional{ a:null,b:null,c:null,d:null,e:null,f:null };
    }
}