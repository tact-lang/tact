struct InnerDef {
    x: Int = 5;
    y: Int? = null;
    z: Bool = false;
}

struct Outer {
    nested: InnerDef;
    val: Int;
}

contract LayeredDefaults {
    data: Outer;

    init() {
        self.data = Outer{
            nested: InnerDef{x: 42, y: null, z: true},
            val: 100
        };
    }
}