struct Layer1 {
    v: Int;
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

struct Layer6 {
    l: Layer5;
}

contract Deep6 {
    rec: Layer6 = Layer6{ l: Layer5{ l: Layer4{ l: Layer3{ l: Layer2{ l: Layer1{ v: 9 } } } } } };

    init() {
        self.rec = Layer6{ l: Layer5{ l: Layer4{ l: Layer3{ l: Layer2{ l: Layer1{ v: 10 } } } } } };
    }
}
