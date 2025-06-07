struct Inner1 {
    a: Int;
}

struct Inner2 {
    b: Int?;
}

struct Inner3 {
    c: Bool;
}

struct Compose {
    inn1: Inner1;
    inn2: Inner2?;
    inn3: Inner3;
    s: String;
}

contract Combo {
    val: Compose;

    init() {
        self.val = Compose{
            inn1: Inner1{ a: 7 },
            inn2: null,
            inn3: Inner3{ c: true },
            s: "abc"
        };
    }
}