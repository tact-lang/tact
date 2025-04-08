struct Leaf { x: Int; }

struct MidOpt { leaf: Leaf?; }

struct Top { mid: MidOpt; }

contract DeepChain(
    t: Top,
) {
    receive() {
        if (self.t.mid.leaf != null) {
            let _ = self.t.mid.leaf!!.x;
        }
    }
}