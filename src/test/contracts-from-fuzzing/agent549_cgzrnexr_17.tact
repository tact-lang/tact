struct Alt1 { p: Int; }
struct Alt2 { q: Bool; }

struct Mix {
    m1: Alt1;
    m2: Alt2;
    mopt1: Alt1?;
    mopt2: Alt2?;
    flatInt: Int;
    flatBool: Bool;
    flatIntOpt: Int?;
    flatBoolOpt: Bool?;
}

contract ManyOptionals {
    val: Mix;

    init() {
        self.val = Mix{
            m1: Alt1{p:1},
            m2: Alt2{q:true},
            mopt1: null,
            mopt2: null,
            flatInt: 10,
            flatBool: false,
            flatIntOpt: null,
            flatBoolOpt: null,
        };
    }

    receive() {
        self.val = Mix{
            m1: Alt1{p:2},
            m2: Alt2{q:false},
            mopt1: Alt1{p:3},
            mopt2: Alt2{q:true},
            flatInt: 11,
            flatBool: true,
            flatIntOpt: 1,
            flatBoolOpt: true,
        };
    }
}