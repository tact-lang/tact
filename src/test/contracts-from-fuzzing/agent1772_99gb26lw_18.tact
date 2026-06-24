struct Layer3 {
    val: Int?;
}
struct Layer2 {
    l3a: Layer3;
    l3b: Layer3?;
}
struct Layer1 {
    l2a: Layer2;
    l2b: Layer2?;
}
contract Test18 {
    l1: Layer1;

    init() {
        self.l1 = Layer1{
            l2a: Layer2{
                l3a: Layer3{val: 5},
                l3b: null
            },
            l2b: null
        };
    }
}