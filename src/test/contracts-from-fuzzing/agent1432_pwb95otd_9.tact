struct DeepOptional {
    a: Int?;
    b: Bool;
    c: String?;
    d: Bool?;
    e: String;
}

contract TestContract {
    deepOpt: DeepOptional?;

    init() {
        self.deepOpt = DeepOptional{
            a: null,
            b: true,
            c: "hello",
            d: null,
            e: "end"
        };
    }
}