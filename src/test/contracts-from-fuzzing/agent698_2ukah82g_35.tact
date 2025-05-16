struct Mix {
    a: Int?;
    b: Bool;
    c: Int;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestContract {
    m1: Mix;
    m2: Mix;

    init() {
        self.m1 = Mix{ a:null, b:true, c:5, d:null, e:"hi", f:null };
        self.m2 = Mix{ a:7, b:false, c:10, d:true, e:"bye", f:"test" };
    }
}