// Very large struct value with mixed optionals and default values
struct MegaStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Int = 7;
    h: Bool?;
}

contract MegaContract {
    data: MegaStruct;

    init() {
        self.data = MegaStruct{
            a:1,
            b:null,
            c:"c",
            d:null,
            e:true,
            f:null,
            h:null
        };
    }
}