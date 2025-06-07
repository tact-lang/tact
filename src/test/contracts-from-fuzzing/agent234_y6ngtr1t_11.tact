struct Inner2 {
    foo: Int?;
}

struct Mid2 {
    bar: Inner2;
    baz: Int;
}

struct Outer2 {
    rec: Mid2;
    txt: String;
}

contract DeepNestOpt {
    state: Outer2;

    init() {
        self.state = Outer2{
            rec: Mid2{
                bar: Inner2{foo:null},
                baz:42
            },
            txt:"hello"
        };
    }
}