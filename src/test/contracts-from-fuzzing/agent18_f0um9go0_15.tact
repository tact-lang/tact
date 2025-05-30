struct Composite {
    i: Int;
    s: String;
    b: Bool?;
}

contract ManyComposite {
    c1: Composite;
    c2: Composite;
    c3: Composite;

    init() {
        self.c1 = Composite{ i:1, s:"1", b:true };
        self.c2 = Composite{ i:2, s:"2", b:null };
        self.c3 = Composite{ i:3, s:"3", b:false };
    }
}
