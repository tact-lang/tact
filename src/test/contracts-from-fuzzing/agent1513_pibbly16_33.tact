struct Flat {
    a: Int;
    b: Bool;
    c: String;
}

contract WithManyStructs {
    s1: Flat;
    s2: Flat;
    s3: Flat;
    s4: Flat;
    s5: Flat;
    s6: Flat;

    init() {
        self.s1 = Flat{a:1,b:true,c:"1"};
        self.s2 = Flat{a:2,b:false,c:"2"};
        self.s3 = Flat{a:3,b:true,c:"3"};
        self.s4 = Flat{a:4,b:false,c:"4"};
        self.s5 = Flat{a:5,b:true,c:"5"};
        self.s6 = Flat{a:6,b:false,c:"6"};
    }
}