struct Deep3 {
    layer: Layer2;
}
struct Layer2 {
    deeper: Layer1;
}
struct Layer1 {
    value: Int;
}

contract Test {
    st: Deep3;

    init() {
        self.st = Deep3{layer: Layer2{deeper: Layer1{value: 123}}};
    }
}
