struct DeepInit1 {
    a: Int;
}

struct DeepInit2 {
    d1: DeepInit1;
}

struct DeepInit3 {
    d2: DeepInit2;
}

contract DeepInitContract {
    x: DeepInit3 = DeepInit3{ d2: DeepInit2{ d1: DeepInit1{ a:123 } } };
}