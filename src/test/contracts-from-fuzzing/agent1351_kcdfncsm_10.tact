struct MultiOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int?;
    e: String?;
}

contract AllOpt {
    payload: MultiOptionals;

    init() {
        self.payload = MultiOptionals{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}