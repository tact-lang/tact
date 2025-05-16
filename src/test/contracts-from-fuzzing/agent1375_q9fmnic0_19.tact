struct Deeply {
    a: Layer1;
}

struct Layer1 {
    b: Layer2;
}

struct Layer2 {
    c: Layer3;
}

struct Layer3 {
    d: Layer4;
}

struct Layer4 {
    e: Layer5;
}

struct Layer5 {
    x: Int;
}

contract FiveDeep {
    prop: Deeply;

    init() {
        self.prop = Deeply{ a: Layer1{ b: Layer2{ c: Layer3{ d: Layer4{ e: Layer5{ x: 123 } } } } } };
    }
}