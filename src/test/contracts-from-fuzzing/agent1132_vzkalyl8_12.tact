struct S1 { x: Int; }
struct S2 { s1: S1; flag: Bool; note: String; opt: Int?; }

contract EmbeddedOpt {
    data: S2 = S2{
        s1: S1{x: 7}, flag: true, note: "ok", opt: null
    };

    init() {
        self.data = S2{
            s1: S1{x: 77}, flag: false, note: "changed", opt: 42
        };
    }
}