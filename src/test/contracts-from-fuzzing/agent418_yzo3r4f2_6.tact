struct Layer4 {
    d: Bool;
}

struct Layer3 {
    c: Layer4;
}

struct Layer2 {
    b: Layer3;
}

struct Layer1 {
    a: Layer2;
}

contract VeryDeep {
    val: Layer1 = Layer1{
        a: Layer2{ b: Layer3{ c: Layer4{ d: true } } }
    };

    receive() {
        self.val = Layer1{
            a: Layer2{ b: Layer3{ c: Layer4{ d: false } } }
        };
    }
}