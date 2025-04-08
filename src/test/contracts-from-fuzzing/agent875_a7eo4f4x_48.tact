struct ManyMixTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
}

contract ManyMixTypesTest {
    mm: ManyMixTypes;
    init() {
        self.mm = ManyMixTypes{
            a:1, b:true, c:"x",
            d:null, e:false, f:null,
            g:7, h:false, i:"y"
        };
    }
}