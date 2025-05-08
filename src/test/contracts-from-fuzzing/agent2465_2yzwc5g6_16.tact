struct EmptyStringDefault {
    s: String = "";
    n: Int;
}

contract TestContract {
    val: EmptyStringDefault;

    init() {
        self.val = EmptyStringDefault{
            n: 777
        };
    }
}