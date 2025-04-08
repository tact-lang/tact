struct Mix {
    a: Int;
    b: Bool?;
    c: String;
    d: Bool;
    e: String?;
    f: Int?;
}

contract TestContract {
    storage: Mix;
    
    init() {
        self.storage = Mix{
            a: 1,
            b: true,
            c: "hello",
            d: false,
            e: null,
            f: null
        };
    }
}
