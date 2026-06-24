struct Leaf { v: Int; }
struct MidOpt { leaf1: Leaf?; leaf2: Leaf?; }
struct Top {
  m1: MidOpt?;
  m2: MidOpt;
}

contract NestedOpts {
    val: Top;

    init() {
        self.val = Top{
            m1: null,
            m2: MidOpt{
                leaf1: null,
                leaf2: Leaf{v:5}
            }
        };
    }
}