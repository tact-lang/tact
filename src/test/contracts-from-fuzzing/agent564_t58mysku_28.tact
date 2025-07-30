// Deep optionals with complex struct including string
struct Leaf {
    note: String;
}

struct MidOpt {
    inside: Leaf?;
}

contract OptStructString {
    state: MidOpt?;
    init() {
        self.state = MidOpt { inside: Leaf { note: "hello" }};
    }
    receive() {
        if (self.state != null && self.state!!.inside != null) {
            let _ = self.state!!.inside!!;
        }
    }
}