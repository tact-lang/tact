struct Tuple {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedTypes {
    field: Tuple;
    init() {
        self.field = Tuple{
            a:1,b:true,c:"hi",d: null,e: false,f: "opt"
        };
    }
}