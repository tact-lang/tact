struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Bool;
}

struct Outer {
    a: Inner1;
    b: Inner2;
    flag: Bool;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            a: Inner1{
                x: 7,
            },
            b: Inner2{
                y: true,
            },
            flag: false,
        };
    }
}