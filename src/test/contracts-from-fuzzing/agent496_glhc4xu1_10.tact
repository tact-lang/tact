struct FooOpt {
    val: Int?;
    label: String?;
}

contract Mixed {
    count: Int = 0;
    flag: Bool = false;
    foo: FooOpt? = null;

    init() {
        self.count = 1;
        self.flag = true;
        self.foo = null;
    }
}