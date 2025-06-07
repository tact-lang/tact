struct InnerX { val: Int?; }
struct MidX { inx: InnerX?; }
struct OutX { mdx: MidX?; }

contract LayeredNullables {
    s: OutX;

    init() {
        self.s = OutX{ mdx: MidX{ inx: InnerX{ val: null } } };
    }
}