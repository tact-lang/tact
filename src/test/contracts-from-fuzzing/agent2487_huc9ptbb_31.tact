struct Diverse {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    diverse: Diverse;
    optional: Diverse?;

    init() {
        self.diverse = Diverse{a:1,b:true,c:"c",d:null,e:null,f:null};
        self.optional = null;
    }
}