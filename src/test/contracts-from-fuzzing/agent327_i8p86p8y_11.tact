struct L3 {
    z: Int;
}
struct L2 {
    y: L3;
}
struct L1 {
    x: L2;
}

contract InitChain {
    val: L1;
    init() {
        self.val = L1{
            x: L2{
                y: L3{ z: 777 }
            }
        };
    }
}