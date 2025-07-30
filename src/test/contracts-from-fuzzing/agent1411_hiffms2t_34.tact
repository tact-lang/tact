// deeply nested struct multiple optional fields in different layers
struct L3 { z: Bool? }
struct L2 { y: Int?; inner: L3 }
struct L1 { x: Int?; mid: L2 }

contract TestContract {
    data: L1;
    init() {
        self.data = L1{
            x: null,
            mid: L2{
                y: null,
                inner: L3{z:null}
            }
        };
    }
}