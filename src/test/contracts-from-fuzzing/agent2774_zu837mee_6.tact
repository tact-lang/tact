// contract with a struct with many optional diverse fields
struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;
}

contract TestContract {
    val: ManyOpts;

    init() {
        self.val = ManyOpts{
            a:null,
            b:null,
            c:null,
            d:null,
            e:null,
            f:null,
            g:null
        };
    }
}