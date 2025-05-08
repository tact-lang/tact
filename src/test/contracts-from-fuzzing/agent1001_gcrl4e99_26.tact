struct L1 { x: Int; }
struct L2 { l: L1; y: String; }
struct L3 { l: L2; z: Bool; }
struct L4 { l: L3; k: Int; }

contract Deepest {
    f: L4;

    init() {
        self.f = L4{
            l: L3{
                l: L2{
                    l: L1{ x: 4 },
                    y: "hey"
                },
                z: true
            },
            k: 99
        };
    }
}