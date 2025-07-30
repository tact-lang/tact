struct Little {
    x: Int;
}

struct Middle {
    l: Little;
    y: String;
}

struct Big {
    m: Middle;
    z: Bool;
}

contract CascadeNested {
    rec: Big;

    init() {
        self.rec = Big{
            m: Middle{l: Little{x:5}, y:"hi"},
            z:true
        };
    }
}