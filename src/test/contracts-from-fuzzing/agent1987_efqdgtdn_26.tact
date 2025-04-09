struct AnnotatedNested {
    foo: Int as uint8;
    bar: DeepInner;
}

struct DeepInner {
    a: Int as int16;
    b: Bool;
    c: String;
}

contract SerializationNested {
    val: AnnotatedNested;
    init() {
        self.val = AnnotatedNested{
            foo: 255,
            bar: DeepInner{a:-123,b:true,c:"hi"}
        };
    }
}