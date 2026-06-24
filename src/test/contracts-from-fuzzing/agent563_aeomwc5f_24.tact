struct N {
    val: Int;
}

struct Mix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    ns: N;
    nsOpt: N?;
}

contract MixedStorage {
    data: Mix;

    init() {
        self.data = Mix{
            a:1,
            b:null,
            c:true,
            d:null,
            e:"text",
            f:null,
            ns: N{ val: 7 },
            nsOpt: null
        };
    }
}