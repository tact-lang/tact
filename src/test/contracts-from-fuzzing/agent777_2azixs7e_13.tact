struct Middle {
    a: Int;
    b: Bool?;
}

struct Deep {
    inner1: Middle;
    inner2: Middle;
    inner3: Middle;
}

contract DeepLots {
    val: Deep;

    init() {
        self.val = Deep{
            inner1: Middle{a:1,b:null},
            inner2: Middle{a:2,b:true},
            inner3: Middle{a:3,b:false}
        };
    }
}