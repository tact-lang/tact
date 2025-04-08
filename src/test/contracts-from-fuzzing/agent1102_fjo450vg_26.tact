// test multiple layers of nested optionals
struct Bottom {
    val: Int;
}

struct MidOpt {
    child: Bottom?;
}

struct TopOpt {
    mid: MidOpt?;
}

contract OptionalCascade {
    root: TopOpt?;

    init() {
        self.root = TopOpt{ mid: null };
    }
}
