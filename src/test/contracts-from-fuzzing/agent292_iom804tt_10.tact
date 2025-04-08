struct StringWrapper {
    text: String;
}

struct Outer {
    field: StringWrapper;
}

contract StringNested {
    s: Outer;

    init() {
        self.s = Outer{ field:StringWrapper{ text:"test" } };
    }
}