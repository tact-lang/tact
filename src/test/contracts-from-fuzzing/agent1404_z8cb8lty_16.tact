struct Mix {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract PersistentMix {
    value: Mix;

    init() {
        self.value = Mix{
            a:1,
            b:null,
            c:true,
            d:false,
            e:"hello",
            f:null,
        };
    }
}
