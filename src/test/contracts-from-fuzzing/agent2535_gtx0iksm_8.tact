struct Deep {
    a: Int;
    b: Int?;
    c: Bool;
}

struct StructWithOptionals {
    one: Deep?;
    two: Deep?;
}

contract OptionalStructFields {
    storage: StructWithOptionals;

    init() {
        self.storage = StructWithOptionals{
            one: Deep{a:1, b:null, c:true},
            two: null,
        };
    }
}