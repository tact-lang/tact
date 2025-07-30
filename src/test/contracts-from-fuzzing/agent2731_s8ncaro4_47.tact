struct Pack1 {
    a: Int;
}

struct Pack2 {
    b: String;
}

struct Pack3 {
    c: Bool;
}

struct MainPack {
    p1: Pack1;
    p2: Pack2;
    p3: Pack3;
    optInt: Int?;
}

contract PackContract {
    data: MainPack;
    init() {
        self.data = MainPack{
            p1: Pack1{a:1},
            p2: Pack2{b:"hi"},
            p3: Pack3{c:true},
            optInt: null
        };
    }
}