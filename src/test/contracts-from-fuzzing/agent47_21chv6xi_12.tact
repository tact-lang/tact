struct NestedOptional {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct MixedNested {
    n1: NestedOptional;
    n2: NestedOptional?;
    s: String;
    b: Bool;
}

contract NestedOptionals {
    st: MixedNested;

    init() {
        self.st = MixedNested{
            n1: NestedOptional{ foo:null, bar:true, baz:null},
            n2: null,
            s: "hello",
            b: true
        };
    }
}