struct Simple {
    a: Int;
}

contract OptStructDefault {
    val: Simple?;
    init() {
        self.val = null;
    }
}