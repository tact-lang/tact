struct StructA { x: Int; }
struct StructB { a: StructA; y: Int; }
struct StructC { b: StructB; z: Int; }

contract ComposeDeep {
    store: StructC;

    init() {
        self.store = StructC{
            b: StructB{ a: StructA{x:7}, y:8 },
            z: 9
        };
    }
}