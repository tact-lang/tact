struct Inner {
    x: Int;
    y: Int;
    s: String;
}

struct Middle {
    flag: Bool;
    nested: Inner;
}

struct Outer {
    id: Int;
    data: Middle;
}

contract NestedStructs {
    field: Outer;

    init() {
        self.field = Outer{
            id: 7,
            data: Middle{
                flag: true,
                nested: Inner{
                    x:1, y:2, s:"hi"
                }
            }
        };
    }
}