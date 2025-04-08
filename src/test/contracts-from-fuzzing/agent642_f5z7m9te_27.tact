// optional struct wrapping optional primitive
struct SOptInner {
    i: Int?;
}

contract OptInOpt {
    val: SOptInner?;

    init() {
        self.val = null;
    }
}