struct BadOptDefault {
    foo: Int? = null;
}

contract Buggy {
    val: BadOptDefault;

    init() {
        self.val = BadOptDefault { foo: null };
    }
}