struct Layer1 {
    f: Int;
}
struct Layer2 {
    l: Layer1;
}
struct Layer3 {
    l: Layer2;
}
struct Layer4 {
    l: Layer3;
}
struct Layer5 {
    l: Layer4;
}

contract DeepContract {
    val: Layer5;
    init() {
        self.val = Layer5{ l: Layer4{ l: Layer3{ l: Layer2{ l: Layer1{ f: 123 } } } } };
    }
}