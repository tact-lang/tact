struct SubNested {
    foo: Int;
    bar: Bool?;
    baz: String;
}

struct SuperNested {
    a: Int;
    b: Bool;
    c: SubNested;
}

contract SuperNestedTest {
    s: SuperNested;

    init() {
        self.s = SuperNested{
            a:1,
            b:true,
            c: SubNested{foo:2, bar:null, baz:"test"}
        };
    }
}