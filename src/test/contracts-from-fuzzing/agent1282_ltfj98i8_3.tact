struct S {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
}

contract Defaults {
    val: S;

    init() {
        self.val = S{};
    }
}