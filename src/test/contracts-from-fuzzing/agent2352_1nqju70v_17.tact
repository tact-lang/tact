struct L3 { z: Bool?; }
struct L2 { y: String; l3: L3; }
struct L1 { x: Int?; l2: L2?; }

contract DeepOptionals {
    top: L1;

    init() {
        self.top = L1{
            x: 42,
            l2: L2{
                y: "abc",
                l3: L3{ z: null }
            }
        };
    }
}