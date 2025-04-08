struct S {
    msg: String = "";
    val: Int;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            msg: "",
            val: 42
        };
    }
}