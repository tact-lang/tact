struct DuplicateNames {
    x: Int;
    X: Bool;
}

contract DupTest {
    val: DuplicateNames;

    init() {
        self.val = DuplicateNames{
            x: 1,
            X: false,
        };
    }
}
