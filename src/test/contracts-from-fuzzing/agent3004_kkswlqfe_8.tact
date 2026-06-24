struct Inner1 { a: Int; }
struct Inner2 { b: Int; }

struct Middle {
    left: Inner1;
    right: Inner2;
}

struct Outer {
    mid: Middle;
    flag: Bool;
    text: String;
}

contract DeepManyTypes {
    val: Outer;

    init() {
        self.val = Outer{
            mid: Middle{
                left: Inner1{ a: 10 },
                right: Inner2{ b: 20 }
            },
            flag: false,
            text: "text"
        };
    }
}