struct Defaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
    d: String?;
    e: Bool?;
}

contract TestContract {
    data: Defaults;
    init() {
        self.data = Defaults{
            d: null,
            e: false
        };
    }
}
