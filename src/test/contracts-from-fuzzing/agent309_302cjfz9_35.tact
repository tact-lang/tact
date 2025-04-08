struct InnerD {
    aa:Int;
    bb:Int;
}

struct MiddleD {
    in1: InnerD;
    in2: InnerD;
}

struct OuterD {
    mid: MiddleD;
}

contract DeepCompose {
    val: OuterD;
    init() {
        self.val = OuterD{ mid: MiddleD{ in1: InnerD{aa:1,bb:2}, in2: InnerD{aa:3,bb:4} } };
    }
}