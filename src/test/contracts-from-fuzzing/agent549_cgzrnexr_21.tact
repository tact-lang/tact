struct Foo {
    a: Int;
    b: Bool;
    c: Int?;
}
struct Bar {
    d: Bool?;
    e: Int;
    f: Foo;
}

contract MixCombos {
    x: Foo;
    y: Bar;

    init() {
        self.x = Foo{a:1,b:true,c:null};
        self.y = Bar{d:null,e:2,f:Foo{a:3,b:false,c:null}};
    }

    receive() {
        self.x = Foo{a:10,b:false,c:123};
        self.y = Bar{d:true,e:11,f:Foo{a:-1,b:true,c:321}};
    }
}