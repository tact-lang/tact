struct Foo { n: Int; }

struct Bar { fooOpt: Foo?; }

contract OptInsideStruct {
    bar: Bar = Bar{ fooOpt: null };
}