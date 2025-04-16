struct Trio {
    a: Int;
    b: Bool;
    c: String;
}

struct Five {
    t1: Trio;
    t2: Trio;
    t3: Trio;
    t4: Trio;
    t5: Trio;
}

contract TestContract {
    state: Five;

    init() {
        self.state = Five{
            t1: Trio{a:1,b:true,c:"1"},
            t2: Trio{a:2,b:false,c:"2"},
            t3: Trio{a:3,b:true,c:"3"},
            t4: Trio{a:4,b:false,c:"4"},
            t5: Trio{a:5,b:true,c:"5"}
        };
    }
}