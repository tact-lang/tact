struct Foo {
    x: Int;
    y: Int?;
    z: Bool;
    nested: Bar;
}

struct Bar {
    w: Int;
    flag: Bool;
}

contract Many {
    f: Foo = Foo{ x:1, y:null, z:true, nested: Bar{ w:7, flag:false } };
}