struct LeafZ { val: Int; }

struct MidZ { leaf: LeafZ?; }

struct RootZ { mid: MidZ?; }

contract OptOpt {
    data: RootZ = RootZ{ mid: null };

    init() {
        self.data = RootZ{
            mid: MidZ{
                leaf: LeafZ{ val: 999 }
            }
        };
    }
}