struct NestedOptionals {
    foo: Int?;
    bar: Bool?;
}

contract OptionalOfOptionalStruct {
    x: NestedOptionals?;

    init() {
        self.x = null;
    }

    receive() {
        let _=self.x;
    }
}