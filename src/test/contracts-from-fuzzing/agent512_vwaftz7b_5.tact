struct NestedDeeply {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct Wrap1 { inner: NestedDeeply; }
struct Wrap2 { inner: Wrap1; }
struct Wrap3 { inner: Wrap2; }
struct Wrap4 { inner: Wrap3; }

contract DeepWrap {
    data: Wrap4;

    init() {
        self.data = Wrap4{
            inner: Wrap3{
                inner: Wrap2{
                    inner: Wrap1{
                        inner: NestedDeeply{
                            a:1,b:2,c:3,d:4,e:5,
                        },
                    },
                },
            },
        };
    }

    receive() {}
}