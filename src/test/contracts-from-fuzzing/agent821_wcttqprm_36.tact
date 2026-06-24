// test embedded struct default value with optionals
struct Foo {
    a: Int = 1;
    b: Bool?;
    c: String? = null;
}

struct Bar {
    foo: Foo = Foo{a:13,b:null,c:null};
}

contract EmbedsWithDefaults {
    data: Bar = Bar{foo:Foo{a:2,b:true,c:"z"}};

    init() {
        self.data = Bar{foo:Foo{a:3,b:false,c:"x"}};
    }
}
