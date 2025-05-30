struct InnerDeep { a: Int; b: Int; }

struct MiddleDeep { x: InnerDeep; y: InnerDeep; }

struct OuterDeep { foo: MiddleDeep; bar: MiddleDeep; }

contract DeeplyNested {
    value: OuterDeep = OuterDeep{
        foo: MiddleDeep{ x: InnerDeep{a:1,b:2}, y: InnerDeep{a:3,b:4} },
        bar: MiddleDeep{ x: InnerDeep{a:5,b:6}, y: InnerDeep{a:7,b:8} }
    };
    receive() {}
}