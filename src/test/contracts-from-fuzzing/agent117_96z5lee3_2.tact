struct Inner {
    foo: Int;
    bar: Bool;
}

struct Outer {
    nested1: Inner;
    nested2: Inner;
    flag: Bool;
    name: String;
}

contract Test2 {
    data: Outer;

    init() {
        self.data = Outer{
            nested1: Inner{foo: 10, bar: true},
            nested2: Inner{foo: 20, bar: false},
            flag: false,
            name: "abc"
        };
    }
}