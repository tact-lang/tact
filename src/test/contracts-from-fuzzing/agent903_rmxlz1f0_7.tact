struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: String;
}

struct Mixed {
    i1: Inner1;
    i2: Inner2;
    flag: Bool;
}

contract MixedNested {
    val: Mixed;

    init() {
        self.val = Mixed{
            i1: Inner1{ x: 5 },
            i2: Inner2{ y: "hello" },
            flag: false
        };
    }
}