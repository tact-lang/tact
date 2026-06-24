struct InnerMost { z: Int }
struct Middle { x: Int; y: InnerMost }
struct Outer { p: Middle; q: Middle }

contract MultiNested {
    storage: Outer = Outer{
        p: Middle{ x: 1, y: InnerMost{ z: 2 } },
        q: Middle{ x: 3, y: InnerMost{ z: 4 } }
    };
}