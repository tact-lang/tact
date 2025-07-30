struct AA {a: Int;}
struct AB {a: Int;}
struct AC {a: Int;}
struct AD {a: Int;}
struct AE {a: Int;}
struct A {
    aa: AA;
    ab: AB;
    ac: AC;
    ad: AD;
    ae: AE;
}

struct BA {a: Int;}
struct BB {a: Int;}
struct BC {a: Int;}
struct BD {a: Int;}
struct BE {a: Int;}
struct B {
    ba: BA;
    bb: BB;
    bc: BC;
    bd: BD;
    be: BE;
}

struct Container {
    a: A;
    b: B;
}

contract Test {
    cont: Container;

    init() {
        self.cont = Container{
            a: A{ aa: AA{a:1}, ab: AB{a:2}, ac: AC{a:3}, ad: AD{a:4}, ae: AE{a:5} },
            b: B{ ba: BA{a:6}, bb: BB{a:7}, bc: BC{a:8}, bd: BD{a:9}, be: BE{a:10} }
        };
    }
}