struct Inner1 {
    foo: Int;
}

struct Inner2 {
    bar: Bool;
    nested: Inner1;
}

struct Inner3 {
    baz: String;
    nested2: Inner2;
}

contract DeepStruct {
    f: Inner3;

    init() {
        self.f = Inner3{
            baz: "",
            nested2: Inner2{
                bar: false,
                nested: Inner1{ foo: 0 }
            }
        };
    }
}