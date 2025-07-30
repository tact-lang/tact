struct MultipleOpts {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptsTest {
    vals: MultipleOpts;
    init() {
        self.vals = MultipleOpts{
            a: null, b: null, c: null
        };
    }
}