struct Innermost {
    x: Int? = null;
}

contract OptOpt {
    val: Innermost?;

    init() {
        self.val = null;
    }
}