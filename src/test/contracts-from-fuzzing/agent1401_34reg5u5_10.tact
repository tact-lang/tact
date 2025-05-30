struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Bool;
}

struct Combo {
    x: Int;
    y: Inner1;
    z: Inner2;
}

contract ComboTest {
    storage: Combo;

    init() {
        self.storage = Combo{
            x: 10,
            y: Inner1{a: 20},
            z: Inner2{b: true}
        };
    }
}