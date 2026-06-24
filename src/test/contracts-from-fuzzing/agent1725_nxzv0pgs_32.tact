struct Weird {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
    e: String;
    f: Bool?;
}

contract TestContract {
    stuff: Weird;

    init() {
        self.stuff = Weird{
            a:42,
            b:null,
            c:true,
            d:null,
            e:"hi",
            f:false
        };
    }
}