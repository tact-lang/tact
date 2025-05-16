struct DefaultsFirst {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";

    d: Int;
    e: Bool;
    f: String;
}

contract DefaultsLeading {
    data: DefaultsFirst;
    
    init() {
        self.data = DefaultsFirst {
            d: 10,
            e: false,
            f: "hey",
        };
    }
}