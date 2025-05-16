struct Mixed {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract MixedFields {
    val: Mixed;

    init() {
        self.val = Mixed{a:1, b:null, c:"hi", d:null, e:true, f:null};
    }
}