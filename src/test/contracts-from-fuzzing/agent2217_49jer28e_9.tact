struct Cascade {
    one: Int;
    two: Inner1;
    three: Int;
}

struct Inner1 {
    a: Int;
    b: Inner2;
    c: Int;
}

struct Inner2 {
    d: Int;
    e: Inner3;
    f: Int;
}

struct Inner3 {
    g: Int;
}

contract MultiLevel {
    data: Cascade;

    init() {
        self.data = Cascade{
            one:1,
            two: Inner1{
                a:2,
                b: Inner2{
                    d:3,
                    e: Inner3{ g:4 },
                    f:5
                },
                c:6
            },
            three:7
        };
    }
}
