struct BoolNest {
    flag: Bool;
}

contract BoolTest {
    val: BoolNest;

    init() {
        self.val = BoolNest{ flag: true };
    }
}
