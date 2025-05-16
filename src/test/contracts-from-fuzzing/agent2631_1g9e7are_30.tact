struct Tup {
    x: Int;
    y: Bool;
}

contract TupleLikeOption {
    val: Tup?;

    init() {
        self.val = null;
    }
}