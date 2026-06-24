// Struct with many optional primitives
struct ManyOpts {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Address?;
}

contract TestContract {
    complex: ManyOpts;

    init() {
        self.complex = ManyOpts {
            a:null, b:true, c:"str", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress()
        };
    }

    receive() {}
}