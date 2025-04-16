struct Deep {
    a: Int;
}

struct MidOptional {
    nested: Deep?;
}

struct Outer {
    middle: MidOptional;
}

contract DeepOptionalField {
    field: Outer;

    init() {
        self.field = Outer{middle:MidOptional{nested:null}};
    }
}