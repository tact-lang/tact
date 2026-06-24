// Deep optional in persistent state, check compiler null behavior
struct InnerMost { x: Int? }
struct Layer2 { inner: InnerMost? }
struct Layer1 { layer: Layer2? }

contract DeepOpt {
    root: Layer1;

    init() {
        self.root = Layer1{ layer: null };
    }
}