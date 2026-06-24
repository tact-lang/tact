struct Small {
    a:Int;
}

struct Medium {
    s:Small;
    b:Int;
}

struct Big {
    m:Medium;
    c:Int;
}

contract Sizing {
    saved:Big;

    init() {
        self.saved = Big{
            m:Medium{
                s:Small{a:1},
                b:2
            },
            c:3
        };
    }
}