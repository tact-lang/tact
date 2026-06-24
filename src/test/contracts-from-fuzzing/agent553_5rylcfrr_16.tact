struct Mixed {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract MixedTypes {
    state: Mixed;

    init() {
        self.state = Mixed{
            a:1, b:null, c:"abc", d:null, e:true, f:null
        };
    }
}