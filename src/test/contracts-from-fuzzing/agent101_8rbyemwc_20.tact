struct Layer3 {
    x: Int;
}
struct Layer2 {
    l3: Layer3;
}
struct Layer1 {
    l2: Layer2;
}

contract TestContract {
    val: Layer1;
    init() {
        self.val = Layer1{ l2: Layer2{ l3: Layer3{ x: 8 } } };
    }
}