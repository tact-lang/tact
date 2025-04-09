struct Small {
    n: Int;
}

contract OptDefault {
    val: Small? = null;

    init() {
        self.val = null;
    }
}