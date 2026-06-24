// deeply nested optionals inside structs in fields
struct InnerMost {
    id: Int?;
    flag: Bool?;
}

struct Middle {
    part: InnerMost?;
    label: String;
}

struct Outer {
    content: Middle?;
}

contract NestedOptionals {
    field: Outer;

    init() {
        self.field = Outer{ content: null };
    }
}