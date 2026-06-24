struct LongNested {
    l1: L1;
}
struct L1 {
    l2: L2;
}
struct L2 {
    l3: L3;
}
struct L3 {
    l4: L4;
}
struct L4 {
    l5: L5;
}
struct L5 {
    l6: L6;
}
struct L6 {
    x: Int;
}

contract DeepChain {
    value: LongNested;
    init() {
        self.value = LongNested{
            l1: L1{l2: L2{l3: L3{l4: L4{l5: L5{l6: L6{x:42}}}}}}
        };
    }
}