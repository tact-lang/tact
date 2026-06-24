struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Bool;
    z: Inner1;
}

struct Outer {
    s: Inner2;
    v: String;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            s: Inner2{
                y: false,
                z: Inner1{ x: 999 }
            },
            v: "nested"
        };
    }
}