struct Mix {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Bool;
    f: Bool?;
}

contract MixFields {
    val: Mix;

    init() {
        self.val = Mix{
            a:1,
            b:null,
            c:"abc",
            d:null,
            e:true,
            f:false
        };
    }
}
