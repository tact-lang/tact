struct MultiLevel {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Int;
    h: String;
    i: Bool;
    j: Int?;
}

contract TestContract {
    store: MultiLevel;

    init() {
        self.store = MultiLevel{
            a:1,
            b:"b",
            c:true,
            d:null,
            e:null,
            f:null,
            g:2,
            h:"h",
            i:false,
            j:null
        };
    }
}