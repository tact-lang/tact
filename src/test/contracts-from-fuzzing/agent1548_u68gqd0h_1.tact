struct NestedOpts {
    a: Int?;     
    b: Bool?;    
    c: Address?;
}

contract TestContract {
    f1: Int = 1;
    f2: NestedOpts;

    init() {
        self.f2 = NestedOpts{
            a: null,
            b: true,
            c: null
        };
    }
}