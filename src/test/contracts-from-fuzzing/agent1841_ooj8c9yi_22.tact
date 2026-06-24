struct First {
    s: Second;
    n: Int;
}

struct Second {
    t: Third;
    m: Int;
}

struct Third {
    x: Int;
    y: Bool;
}

contract ChainNested {
    val: First;

    init() {
        self.val = First{
            s: Second{
                t: Third{x:1,y:true},
                m:2
            },
            n:3
        };
    }
}
