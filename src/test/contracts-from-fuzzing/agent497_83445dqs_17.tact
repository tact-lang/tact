struct L1 { l2: L2; flag: Bool; }
struct L2 { l3: L3; value: Int; }
struct L3 { s: String; ok: Bool; }

contract MidDeep {
    root: L1;

    init() {
        self.root = L1{
            l2: L2{
                l3: L3{
                    s: "deep",
                    ok: true
                },
                value: 42
            },
            flag: false
        };
    }
}