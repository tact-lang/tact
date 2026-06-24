struct Sub {
    a: Int;
    b: Bool;
    s: String;
}

struct Mid {
    sub1: Sub;
    sub2: Sub;
}

contract MultiStruct {
    val: Mid;

    init() {
        self.val = Mid{
            sub1: Sub{a:1, b:true, s:"a"},
            sub2: Sub{a:2, b:false, s:"b"},
        };
    }
}