struct InnerMost {
    z: Int;
}
struct Inner {
    m: InnerMost;
}
struct Mid {
    inr: Inner;
}

contract DeepStack {
    val: Mid;

    init() {
        self.val = Mid{inr: Inner{m: InnerMost{z:42}}};
    }
}