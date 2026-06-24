struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
}

contract MixNested {
    one: BigNested;
    two: BigNested;

    init() {
        self.one = BigNested{a:1, b:true, c:"hi", d:null, e:false};
        self.two = BigNested{a:2, b:false, c:"bye", d:5, e:null};
    }
}