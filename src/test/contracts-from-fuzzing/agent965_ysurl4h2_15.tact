struct Layer3 {
    inner: Int;
}

struct Layer2 {
    child: Layer3;
}

struct Layer1 {
    mid: Layer2;
}

contract VeryDeepNested {
    top: Layer1;

    init() {
        self.top = Layer1{ mid: Layer2{ child: Layer3{ inner: 999 } } };
    }
}