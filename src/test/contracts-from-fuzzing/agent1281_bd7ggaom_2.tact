struct NestedStructLevel2 {
    a: Int;
    b: Bool;
}

struct NestedStructLevel1 {
    val: Int;
    opt: Bool?;
    inside: NestedStructLevel2;
}

contract DeepNested {
    storage: NestedStructLevel1 = NestedStructLevel1{
        val: 1,
        opt: null,
        inside: NestedStructLevel2{ a: 2, b: true }
    };

    init() {
        self.storage = NestedStructLevel1{
            val: 10,
            opt: false,
            inside: NestedStructLevel2{ a: 20, b: false }
        };
    }
}