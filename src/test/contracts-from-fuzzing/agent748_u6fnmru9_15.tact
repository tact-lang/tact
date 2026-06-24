struct Nested {
    f1: Int;
    f2: Bool?;
    f3: String?;
}

contract TestContract {
    a: Int = 1;
    b: Int? = null;
    c: Bool = true;
    d: String = "hi";
    e: Nested? = null;

    init() {
        self.b = 2;
        self.e = Nested{
            f1: 3,
            f2: false,
            f3: null
        };
    }
}