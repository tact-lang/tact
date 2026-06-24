struct Bar { 
    a: Int;
}

struct Foo { 
    bar: Bar;
    flag: Bool;
}

contract EmbedStruct {
    f: Foo;

    init() {
        self.f = Foo{
            bar: Bar{a:42},
            flag:true
        };
    }
}