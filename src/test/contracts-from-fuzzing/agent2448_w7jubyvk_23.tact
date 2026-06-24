struct Combined {
    s: String;
    b: Bool;
    n: Int;
    optStr: String?;
    optInt: Int?;
    optBool: Bool?;
}

contract CombTest {
    data: Combined;
    
    init() {
        self.data = Combined{
            s: "hello",
            b: true,
            n: 1,
            optStr: null,
            optInt: null,
            optBool: null,
        };
    }
}
