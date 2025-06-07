struct A { i: Int; }

contract OptionalDefault {
    val: A? = null;

    init() {
        self.val = null;
    }
}