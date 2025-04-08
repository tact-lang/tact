struct LayerA { foo: Int; }
struct LayerB { bar: LayerA; }
struct LayerC { baz: LayerB; }

contract NestedTriple {
    data: LayerC;

    init() {
        self.data = LayerC{
            baz: LayerB{
                bar: LayerA{
                    foo: 42
                }
            }
        };
    }
}