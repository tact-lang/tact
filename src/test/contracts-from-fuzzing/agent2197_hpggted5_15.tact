struct A {
    foo: Int;
    bar: Bool;
}

struct B {
    first: A;
    second: A;
    third: A;
}

struct OuterMost {
    nested: B;
    flag: Bool;
    value: Int;
}

contract Deep {
    state: OuterMost;

    init() {
        self.state = OuterMost{
            nested: B{
                first: A{foo:1, bar:true},
                second: A{foo:2, bar:false},
                third: A{foo:3, bar:true}
            },
            flag: true,
            value: 42
        };
    }
}