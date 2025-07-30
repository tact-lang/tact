struct BigDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Int = -1;
    e: Bool = true;
    f: String = "hey";
}

contract DefaultedStructTest {
    val: BigDefault;
    init() {
        self.val = BigDefault{};
    }
}