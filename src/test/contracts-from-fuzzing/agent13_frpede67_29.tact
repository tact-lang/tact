// struct with all primitive nullable types at once
struct AllOpts {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
    sl: Slice?;
}

contract TestContract {
    val: AllOpts;
    init() {
        self.val = AllOpts {
            i: null, b: null, s: null, a: null, c: null, sl: null
        };
    }
}