struct AllNulls {
    a: Int?;
    b: String?;
    c: Address?;
    d: Bool?;
}

contract AllNullOptionals {
    s: AllNulls;
    init() {
        self.s = AllNulls{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}