struct MixOptional {
    foo: Int;
    bar: Int?;
    baz: Int;
    qux: Int?;
}

contract MixedOptNested {
    data: MixOptional = MixOptional { foo:1, bar:null, baz:2, qux:null };
    init() {
        self.data = MixOptional{ foo:3, bar:4, baz:5, qux:6 };
    }
    receive() {}
}