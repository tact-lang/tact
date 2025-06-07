struct SerialOpt {
    a: Int as uint8;
    b: Int?; 
    c: Bool?;
    d: String;
    e: Bool = false;
    f: Int?; 
}

contract TestContract {
    so: SerialOpt?;

    init() {
        self.so = SerialOpt{
            a: 100,
            b: null,
            c: true,
            d: "test",
            e: true,
            f: 123
        };
    }
}