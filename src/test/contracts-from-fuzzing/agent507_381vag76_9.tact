struct Outer {
    a: Int;
    b: Bool;
    c: Inner1;
    d: Inner2;
}

struct Inner1 {
    val: Int?;
}

struct Inner2 {
    flag: Bool?;
    text: String;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            a: 1,
            b: true,
            c: Inner1{val: null},
            d: Inner2{flag: null, text: ""}
        };
    }
}