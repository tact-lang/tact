struct MultiOptions {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Slice?;
}

contract TestContract {
    mo: MultiOptions;

    init() {
        self.mo = MultiOptions{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}