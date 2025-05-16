struct Leaf1 {
    x: Int;
}
struct Leaf2 {
    y: Int;
}
struct Middle1 {
    l1: Leaf1;
}
struct Middle2 {
    l2: Leaf2;
}
struct TopStruct {
    m1: Middle1;
    m2: Middle2;
}

contract TestContract {
    d: TopStruct;
    init() {
        self.d = TopStruct{
            m1: Middle1{l1: Leaf1{x:5}},
            m2: Middle2{l2: Leaf2{y:6}}
        };
    }
}