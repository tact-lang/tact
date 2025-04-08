struct Foo {
    a: Int;
    b: String;
}

contract MultipleStructsOptional {
    foo1: Foo?;
    foo2: Foo?;
    foo3: Foo?;

    init() {
        self.foo1=null;
        self.foo2=Foo{a:5,b:"hi"};
        self.foo3=null;
    }
}
