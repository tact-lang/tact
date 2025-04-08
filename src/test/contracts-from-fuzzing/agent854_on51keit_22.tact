struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Int;
}

struct Combo {
    a: Inner1;
    b: Inner2;
}

contract CombinationContract {
    c: Combo;

    init() {
        self.c = Combo{
            a: Inner1{ x: 1 },
            b: Inner2{ y: 2 }
        };
    }
}