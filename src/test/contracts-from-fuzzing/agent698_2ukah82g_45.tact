struct M {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: String?;
    f: String;
}

contract TestContract {
    m: M;

    init() {
        self.m = M{
            a:null, b:5, c:false, d:true, e:null, f:"hi"
        };
    }
}