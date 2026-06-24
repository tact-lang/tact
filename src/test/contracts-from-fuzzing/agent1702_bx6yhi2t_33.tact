struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

contract ManyDeepOptionals {
    o1: Deep?;
    o2: Deep?;

    init() {
        self.o1 = Deep{a:1,b:true,c:"a",d:null};
        self.o2 = null;
    }
}
