struct A {
    foo: Int?;
    bar: String;
    baz: Bool?;
}

struct B {
    inner: A;
    num: Int;
    flag: Bool;
}

contract NestedOptionals {
    value: B;

    init() {
        self.value = B{
            inner: A { foo:null, bar:"hi", baz:true },
            num: 7,
            flag: false,
        };
    }
}