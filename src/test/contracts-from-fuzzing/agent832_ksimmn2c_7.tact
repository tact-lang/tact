struct Flat {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

struct Nested {
    flat1: Flat;
    flat2: Flat;
}

struct Container {
    nested1: Nested;
    nested2: Nested;
}

contract DeepFlat {
    data: Container;

    init() {
        self.data = Container{
            nested1: Nested{
                flat1: Flat{a:1,b:2,c:3,d:4,e:5,f:6},
                flat2: Flat{a:7,b:8,c:9,d:10,e:11,f:12},
            },
            nested2: Nested{
                flat1: Flat{a:13,b:14,c:15,d:16,e:17,f:18},
                flat2: Flat{a:19,b:20,c:21,d:22,e:23,f:24},
            }
        };
    }
}