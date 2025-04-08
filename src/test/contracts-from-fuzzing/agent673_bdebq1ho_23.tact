struct Deep {
    a: Int;
    b: Bool?;
}

struct Wrap1 {
    d: Deep;
}

struct Wrap2 {
    w: Wrap1;
}

contract WrapChain {
    val: Wrap2;

    init() {
        self.val = Wrap2{ w: Wrap1{ d: Deep{ a:1, b:null } } };
    }
}