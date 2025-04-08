struct InnerMost {
    z: Int?;
}

struct Middle {
    y: InnerMost;
}

contract TestContract {
    outer: Middle = Middle{ y: InnerMost{ z: null } };
}