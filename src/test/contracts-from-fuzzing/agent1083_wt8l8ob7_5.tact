struct NestedOptional {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeString: String?;
}

struct BigNested {
    inner1: NestedOptional;
    inner2: NestedOptional;
    inner3: NestedOptional;
}

contract ManyOptionals {
    big: BigNested;

    init() {
        self.big = BigNested{
            inner1: NestedOptional{maybeInt:null, maybeBool:null, maybeString:null},
            inner2: NestedOptional{maybeInt:null, maybeBool:null, maybeString:null},
            inner3: NestedOptional{maybeInt:null, maybeBool:null, maybeString:null}
        };
    }
}