struct L1 { x: Int; }
struct L2 { mid: L1; y: Bool; }
struct L3 { deep: L2; }

contract DeepChain {
    r: L3;
    init() {
        self.r = L3{deep: L2{mid:L1{x:3}, y:true}};
    }
}