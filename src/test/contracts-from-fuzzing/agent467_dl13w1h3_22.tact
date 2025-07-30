// Stress test deeply nested structs with multiple fields each
struct L1 {
    a: Int; b: Int;
}
struct L2 {
    l1: L1; x: Int;
}
struct L3 {
    l2: L2; y: Int;
}
struct L4 {
    l3: L3; z: Int;
}
struct L5 {
    l4: L4; w: Int;
}

contract DeepHugeNest {
    val: L5;

    init() {
        self.val = L5{
            l4:L4{
                l3:L3{
                    l2:L2{
                        l1:L1{a:1,b:2},
                        x:3
                    },
                    y:4
                },
                z:5
            },
            w:6
        };
    }
}
