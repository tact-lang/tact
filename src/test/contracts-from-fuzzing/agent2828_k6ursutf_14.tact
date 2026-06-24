struct Leaf { val: Int; }
struct Middle { leafOpt: Leaf?; }

contract OptWithOpt {
    mOpt: Middle?;

    init() {
        self.mOpt = null;
    }
}