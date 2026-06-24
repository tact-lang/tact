struct DeepNestedMixed {
    a: Int; b: Bool;
    sub: SubStruct;
}

struct SubStruct {
    x: Int; y: Bool; t: String;
}

contract DeepMixedStorage {
    container: DeepNestedMixed;

    init() {
        self.container = DeepNestedMixed {
            a: 1,
            b: true,
            sub: SubStruct { x: 42, y: false, t: "test" }
        };
    }

    receive() {
        let _ = self.container.sub.x;
    }
}