struct Deep {
    a: Int;
    b: Bool?;
    c: String;
}

struct Middle {
    d: Deep;
    e: Deep?;
}

contract Test {
    val: Middle;

    init() {
        self.val = Middle{
            d: Deep{a:1,b:true,c:"hi"},
            e: null
        };
    }
}