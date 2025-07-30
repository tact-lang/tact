struct L4 { x: Int; }
struct L3 { l4: L4; y: Bool; }
struct L2 { l3: L3; z: String; }
struct L1 { l2: L2; w: Int; }

contract TestContract {
    data: L1;
    init() {
        self.data = L1{
            w: 1,
            l2: L2{
                z: "z",
                l3: L3{
                    y: true,
                    l4: L4{ x: 777 }
                }
            }
        };
    }
}