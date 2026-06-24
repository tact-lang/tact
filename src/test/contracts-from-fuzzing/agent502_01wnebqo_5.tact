struct Flat {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
}

contract TestContract {
    s1: Flat;
    s2: Flat;
    s3: Flat;
    s4: Flat;

    init() {
        self.s1 = Flat{a:1,b:true,c:"a",d:2};
        self.s2 = Flat{a:3,b:false,c:"b",d:4};
        self.s3 = Flat{a:5,b:true,c:"c",d:6};
        self.s4 = Flat{a:7,b:false,c:"d",d:8};
    }
}