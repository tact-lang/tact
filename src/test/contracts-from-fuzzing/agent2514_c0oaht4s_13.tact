struct Outer{
    a: Inner1;
    b: Inner2;
}

struct Inner1{
    aa: Int;
    ab: Bool?;
}

struct Inner2{
    ba: String?;
    bb: Bool;
}

contract NestedMix{
    val: Outer;

    init() {
        self.val = Outer{
            a: Inner1{ aa: 1, ab: null },
            b: Inner2{ ba: null, bb: false }
        };
    }
}