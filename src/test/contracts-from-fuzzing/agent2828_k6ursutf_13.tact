struct Leaf { val: Int; }
struct Middle { innerOpt: Leaf?; }
struct Top { mid: Middle; }

contract DeepOptNest {
    root: Top;

    init() {
        self.root = Top{
            mid: Middle{
                innerOpt: null
            }
        };
    }
}