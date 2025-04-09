struct StructInside {
    x: Int;
    y: String;
}

trait SomeTrait {
    foo: Int;
}

contract TraitNestedStruct with SomeTrait {
    foo: Int;
    bar: StructInside;

    init() {
        self.foo = 10;
        self.bar = StructInside{
            x: 1,
            y: "hello",
        };
    }
}