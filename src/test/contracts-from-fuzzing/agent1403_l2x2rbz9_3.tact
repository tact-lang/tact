struct ManyOpts {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
    opt5: Cell?;
}

contract OptsTest {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            opt1: 1,
            opt2: null,
            opt3: null,
            opt4: null,
            opt5: null
        };
    }
}