struct BoolTest {
    a: Bool;
    b: Bool?;
    c: Bool = true;
    d: Bool?;
}

contract OptBools {
    val: BoolTest;
    init() {
        self.val = BoolTest{
            a: false,
            b: null,
            d: null
        };
    }
}
