struct EmptyCase {
    x: Int;
}

contract Test {
    val: EmptyCase?;

    init() {
        self.val = null;
    }
}