// Deeply nested composite with serialization annotations
struct L3 { x: Int as uint8; }
struct L2 { y: L3; }
struct L1 { z: L2; }

contract DeepSerialize {
    state: L1;
    init() {
        self.state = L1 {
            z: L2 {
                y: L3 {
                    x: 255
                }
            }
        };
    }
}