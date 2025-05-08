// Optional wrapping nested struct
struct Foo {
    x: Int;
    y: Bool;
}

contract OptNestedStruct {
    field: Foo?;

    init() {
        self.field = Foo { x: 10, y: true };
    }

    receive() {
        if (self.field != null) {
            let val = self.field!!;
            val.x +=1;
        }
    }
}