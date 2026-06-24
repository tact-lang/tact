struct AllNulls {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    f: String?;
}

contract TestContract {
    s: AllNulls;

    init() {
        self.s = AllNulls{
            a: null, b: null, c: null, d: null, e: null, f: null,
        };
    }
}