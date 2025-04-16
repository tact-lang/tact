// testing optional deeply nested struct as _contract persistent_ optional
struct Last {
    z: Int = 42;
    txt: String = "end";
}

struct MidOpt {
    l: Last?;
}

contract TestContract {
    nestedOpt: MidOpt?;
    init() {
        self.nestedOpt = MidOpt{ l: Last{z:5, txt:"z"} };
    }
}
