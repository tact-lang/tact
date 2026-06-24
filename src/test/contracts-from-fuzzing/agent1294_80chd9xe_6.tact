struct Tuple {
    a: Int;
    b: Bool;
}

struct Pair {
    first: Tuple;
    second: Tuple;
}

struct Quad {
    left: Pair;
    right: Pair;
}

contract Compound {
    quad: Quad;

    init() {
        self.quad = Quad{
            left: Pair{ first: Tuple{a:1,b:true}, second: Tuple{a:2,b:false} },
            right: Pair{ first: Tuple{a:3,b:true}, second: Tuple{a:4,b:false} }
        };
    }
}
