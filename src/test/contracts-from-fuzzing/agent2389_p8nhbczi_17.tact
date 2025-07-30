struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int;
}

struct Combo {
    f1: Inner1;
    f2: Int;
    f3: Inner2;
    f4: String;
}

contract MixNested {
    val: Combo;

    init() {
        self.val = Combo{
            f1: Inner1{a: 1},
            f2: 2,
            f3: Inner2{b:3},
            f4: "hello",
        };
    }
}