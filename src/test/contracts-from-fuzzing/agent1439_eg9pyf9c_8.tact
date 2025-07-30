struct DefaultsOptional {
    a: Int = 1;
    b: String = "test";
    c: Bool?; // null default
    d: Int?;  // null default
}

contract TestContract {
    data: DefaultsOptional;

    init() {
        self.data = DefaultsOptional{
            a:2,
            b:"str",
            c:true,
            d:42,
        };
    }
}