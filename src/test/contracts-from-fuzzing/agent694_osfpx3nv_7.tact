struct One { a: Int; }
struct Two { b: Int; }
struct Three { c: Int; }
struct Four { d: Int; }
struct Five { e: Int; }
struct Six { f: Int; }

struct Combo {
    o: One;
    t: Two;
    th: Three;
    f: Four;
    fi: Five;
    s: Six;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            o: One{a:1},
            t: Two{b:2},
            th: Three{c:3},
            f: Four{d:4},
            fi: Five{e:5},
            s: Six{f:6}
        };
    }
}