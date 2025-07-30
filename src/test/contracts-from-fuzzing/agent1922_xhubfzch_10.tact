struct Embed {
    sub1: Sub1;
    sub2: Sub2;
}

struct Sub1 {
    foo: Int;
    bar: Bool;
}

struct Sub2 {
    baz: String;
    qux: Int?;
}

contract EmbeddedStructs {
    big: Embed;

    init() {
        self.big = Embed{
            sub1: Sub1{foo:1, bar:true},
            sub2: Sub2{baz:"hi", qux:null}
        };
    }
}