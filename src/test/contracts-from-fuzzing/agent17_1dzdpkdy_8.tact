struct Inner { innerVal: Int; }

struct Middle { maybeInner: Inner?; }

struct Outer { maybeMiddle: Middle?; }

contract TestContract {
    nestedOpt: Outer;

    init() {
        self.nestedOpt = Outer{
            maybeMiddle: null
        };
    }
}