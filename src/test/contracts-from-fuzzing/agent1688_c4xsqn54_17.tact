struct Data {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract MixedTypes {
    state: Data;

    init() {
        self.state = Data{
            a:1,
            b:true,
            c:"abc",
            d:null,
            e:null,
            f:null
        };
    }
}