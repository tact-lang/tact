struct SimpleLayer1 {
    a: Int;
}
struct SimpleLayer2 {
    l1: SimpleLayer1;
}
struct SimpleLayer3 {
    l2: SimpleLayer2;
}

contract Test {
    nested: SimpleLayer3;
    init() {
        self.nested = SimpleLayer3{
            l2: SimpleLayer2{
                l1: SimpleLayer1{
                    a:123
                }
            }
        };
    }
}