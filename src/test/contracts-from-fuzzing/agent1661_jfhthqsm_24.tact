struct Mix {
    a: Int;
    b: String?;
    c: Bool;
    d: String?;
    e: Int;
}

contract AltOpt {
    m: Mix = Mix{
        a:1, b:null, c:true, d:null, e:5
    };

    init() {
        self.m = Mix{
            a:2, b:"X", c:false, d:"Y", e:3
        };
    }
}