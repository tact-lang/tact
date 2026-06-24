struct Inner { val: Int = 5; }

struct Middle { maybeInner: Inner?; }

struct Outer { maybeMiddle: Middle?; }

contract DeepOpt2 {
    root: Outer;

    init() {
        self.root = Outer{
            maybeMiddle: Middle{
                maybeInner: null
            }
        };
    }
}