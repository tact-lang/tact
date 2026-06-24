struct BoolWrap {
    yes: Bool;
    no: Bool;
}

contract BoolStructTest {
    b: BoolWrap;

    init() {
        self.b = BoolWrap {
            yes: true,
            no: false
        };
    }
}
