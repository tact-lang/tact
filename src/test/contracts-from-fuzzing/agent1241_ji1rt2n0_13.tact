struct InnerMost { x: Int; y: Bool }
struct Inner { fwd: InnerMost; z: Int }

contract TestManyNestings {
    deeply: Inner;

    init() {
        self.deeply = Inner{
            fwd: InnerMost{ x: 5, y: false },
            z: 42
        };
    }
}
