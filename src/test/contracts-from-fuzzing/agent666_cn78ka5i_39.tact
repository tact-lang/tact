struct ManyDeep {
    a:Int;
    b:ManyDeep2;
}

struct ManyDeep2 {
    c:Int;
    d:ManyDeep3;
}

struct ManyDeep3 {
    e:Int;
    f:ManyDeep4;
}

struct ManyDeep4 {
    g:Int;
    h:ManyDeep5;
}

struct ManyDeep5 {
    i:Int;
}

contract Deeply {
    k: ManyDeep;

    init() {
        self.k=ManyDeep{
        a:1,b:ManyDeep2{c:2,d:ManyDeep3{e:3,f:ManyDeep4{g:4,h:ManyDeep5{i:5}}}}};
    }
}
