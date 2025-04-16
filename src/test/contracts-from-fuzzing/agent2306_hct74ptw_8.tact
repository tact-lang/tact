struct BoolTest {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
}

contract ManyBools {
    data: BoolTest;

    init() {
        self.data = BoolTest{
            flag1: true,
            flag2: false,
            flag3: true
        };
    }
}
