struct Innermost {
    leaf: Int;
}

struct InnerMid {
    child: Innermost;
}

struct OuterMid {
    child: InnerMid;
}

contract FourLevel {
    root: OuterMid;

    init() {
        self.root = OuterMid{ child: InnerMid{ child: Innermost{ leaf: 777 } } };
    }
}