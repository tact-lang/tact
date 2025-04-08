struct NestedSmallInts {
    a: Int as uint4;
    b: Int as uint4;
    c: Int as uint4;
    d: Int as uint4;
    e: Int as uint4;
    f: Int as uint4;
    g: Int as uint4;
    h: Int as uint4;
    i: Int as uint4;
    j: Int as uint4;
}

struct Container {
    inner: NestedSmallInts;
    flag: Bool;
}

contract TinyIntPacked {
    storageData: Container;

    init() {
        self.storageData = Container{
            inner: NestedSmallInts{
                a: 1, b:2, c:3, d:4, e:5, f:6, g:7, h:8, i:9,j:10
            },
            flag: true,
        };
    }
}