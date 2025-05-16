struct DeepNested1 { x: Int; }
struct DeepNested2 { n1: DeepNested1; y: Int; }
struct DeepNested3 { n2: DeepNested2; z: Int; }

contract DeepNestedTest {
    state: DeepNested3;

    init() {
        self.state = DeepNested3{
            n2: DeepNested2{
                n1: DeepNested1{ x: 100 },
                y: 200
            },
            z: 300
        };
    }
}