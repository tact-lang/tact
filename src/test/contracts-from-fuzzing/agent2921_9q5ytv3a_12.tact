struct Weird1 {
    x: Int;
}

struct Weird2 {
    a: Weird1?;
    b: Bool;
}

struct Weird3 {
    c: Weird2?;
    d: String;
}

contract OptionMix {
    val: Weird3;

    init() {
        self.val = Weird3 {
            c: Weird2 {
                a: Weird1 { x: 99 },
                b: false
            },
            d: "ok"
        };
    }
}