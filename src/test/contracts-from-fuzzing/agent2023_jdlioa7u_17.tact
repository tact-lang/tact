struct Mix {
    n: Int;
    s: String;
    b: Bool;
    o: Int?;
    s2: String?;
    b2: Bool?;
}
contract TestContract {
    mix1: Mix;
    mix2: Mix;

    init() {
        self.mix1 = Mix{n:1,s:"a",b:true,o:null,s2:null,b2:null};
        self.mix2 = Mix{n:2,s:"b",b:false,o:42,s2:"c",b2:true};
    }

    receive() { let k = self.mix1.s; }
}