struct Layer4 {
    f: Int;
}
struct Layer3 {
    l4: Layer4;
}
struct Layer2 {
    l3: Layer3;
}
struct Layer1 {
    l2: Layer2;
}

contract TestContract {
    nested: Layer1 = Layer1{l2: Layer2{l3: Layer3{l4: Layer4{f: 42}}}};
}