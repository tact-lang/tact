struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedDefaults {
    val: Mix = Mix{
        a:7, b:true, c:"hi", d:null, e:null, f:null
    };

    init() {
        self.val = Mix{
            a:7, b:true, c:"hi", d:null, e:null, f:null
        };
    }
}