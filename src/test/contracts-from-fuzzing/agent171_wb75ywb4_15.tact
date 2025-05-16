struct Outer {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    foo: Int;
    bar: Bool;
}

struct Inner2 {
    baz: Address;
    text: String;
}

contract TestMultiNested {
    data: Outer;
    init() {
        self.data = Outer{
            inner1: Inner1{ foo:1, bar:true },
            inner2: Inner2{ baz: myAddress(), text:"ok" }
        };
    }
}