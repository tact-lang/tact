struct Inner {
    val: Int;
}

struct Compound {
    x: Int;
    y: Bool?;
    z: Inner;
    w: String?;
}

contract TestComp {
    data: Compound = Compound{ x: 1, y: null, z: Inner{ val: 2 }, w: null };
}