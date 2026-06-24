struct RecData {
    val: Int;
    next: Bool?;
}

contract TestContract {
    list: RecData?;

    init() {
        self.list = null;
    }
}