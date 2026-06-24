struct L1 {
    a: Int; 
    b: Bool; 
}
struct L2 {
    x: L1; 
    y: L1;
}
struct L3 {
    nested: L2;
}

contract Test {
    val: L3;
    init() {
        self.val = L3{ nested: L2{ x: L1{a: 1, b: true}, y: L1{a: 2, b: false} } };
    }
}