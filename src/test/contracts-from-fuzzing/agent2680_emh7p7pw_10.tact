struct Inner1 { innerVal: Int; }
struct Inner2 { text: String; }
struct Outer {
    a: Inner1;
    b: Inner2;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            a: Inner1{ innerVal: 42 },
            b: Inner2{ text: "hello" }
        };
    }
}