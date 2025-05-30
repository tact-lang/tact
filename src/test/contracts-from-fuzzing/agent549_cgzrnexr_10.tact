struct Leaf {
    x: Int;
    y: Bool;
    z: Int?;
}

struct Middle {
    l1: Leaf;
    l2: Leaf;
}

struct Top {
    m1: Middle;
    m2: Middle;
    m3: Middle;
    m4: Middle;
}

contract FourLevels {
    fld: Top;

    init() {
        self.fld = Top{
            m1: Middle{
                l1: Leaf{ x: 1, y: true, z: null },
                l2: Leaf{ x: 2, y: false, z: null },
            },
            m2: Middle{
                l1: Leaf{ x: 3, y: true, z: null },
                l2: Leaf{ x: 4, y: false, z: null },
            },
            m3: Middle{
                l1: Leaf{ x: 5, y: true, z: null },
                l2: Leaf{ x: 6, y: false, z: null },
            },
            m4: Middle{
                l1: Leaf{ x: 7, y: true, z: null },
                l2: Leaf{ x: 8, y: false, z: null },
            }
        };
    }

    receive() {
        let _ = self.fld;
    }
}