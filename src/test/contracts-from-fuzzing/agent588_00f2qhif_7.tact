// deeply nested optional struct fields
struct DeepInner {
    x: Int;
}

struct Middle {
    y: DeepInner?;
}

struct Outer {
    z: Middle?;
}

contract DeeplyNestedOptionals {
    field: Outer;

    init() {
        self.field = Outer{z:null};
    }
}