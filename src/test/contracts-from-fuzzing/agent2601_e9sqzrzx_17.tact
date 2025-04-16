struct Mix {
    a: Int as uint10;
    b: Int as int32;
    c: String;
    d: Bool;
    e: Int?;
    f: Bool?;
}

contract MixContract {
    m: Mix;
    init() {
        self.m = Mix{ a: 5, b: -12, c:"str", d:true, e:null, f:false };
    }
}