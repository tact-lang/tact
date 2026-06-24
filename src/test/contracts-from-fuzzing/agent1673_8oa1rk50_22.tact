struct Stra {
    s: String;
    i: Int;
    b: Bool;
}

contract ManyStras {
    s1: Stra;
    s2: Stra;
    s3: Stra;

    init() {
        self.s1 = Stra{s:"a",i:1,b:true};
        self.s2 = Stra{s:"b",i:2,b:false};
        self.s3 = Stra{s:"c",i:3,b:true};
    }
}