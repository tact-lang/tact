struct DeepStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract ManyOptionals {
    x: DeepStruct;

    init() {
        self.x = DeepStruct{
            a: 1,
            b: null,
            c: "test",
            d: null,
            e: true,
            f: "yep"
        };
    }
}