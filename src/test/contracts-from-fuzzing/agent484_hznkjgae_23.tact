struct X {
    a: Int = 5;
    b: Bool = true;
    c: String = "foo";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    val: X?;

    init() {
        self.val = X{};
    }
}