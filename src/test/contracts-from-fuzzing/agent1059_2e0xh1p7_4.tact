struct Deep {
    foo: Int;
    bar: Bool;
    baz: String;
}

struct Outer {
    nested: Deep;
    flag: Bool;
}

contract TestContract {
    item: Outer;

    init() {
        self.item = Outer{
            nested: Deep{foo: 123, bar: false, baz: "hi"},
            flag: true
        };
    }
}