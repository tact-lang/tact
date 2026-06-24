struct Layer1 {
    val: Int;
}
struct Layer2 {
    val: Layer1;
}
struct Layer3 {
    val: Layer2;
}
struct Layer4 {
    val: Layer3;
}
struct Layer5 {
    val: Layer4;
}

contract MixedComplex {
    field1: Layer3;
    field2: Layer5;
    init() {
        self.field1 = Layer3{ val: Layer2{ val: Layer1{ val: 1 } } };
        self.field2 = Layer5{ val: Layer4{ val: Layer3{ val: Layer2{ val: Layer1{ val: 2 } } } } };
    }
}