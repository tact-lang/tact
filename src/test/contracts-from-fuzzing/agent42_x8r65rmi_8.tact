struct DefaultsVsInit {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
}

contract TestContract {
    data: DefaultsVsInit;

    init() {
        self.data = DefaultsVsInit{
            a: 42,
            b: false,
            c: "bye",
            d: null
        };
    }
}