struct DeepInner {
    x: Int;
    y: String;
    z: Bool;
}

struct Outer {
    nested: DeepInner;
    optionalNested: DeepInner?;
}

contract DeepNestedTest {
    exampleField: Outer = Outer{
        nested: DeepInner{x: 0, y: "", z: false},
        optionalNested: null
    };
}