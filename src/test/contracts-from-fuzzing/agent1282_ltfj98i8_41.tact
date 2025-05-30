// Persistent storage with optional of struct of optional of struct
struct InnerMost { val: Int; }
struct Inner { next: InnerMost?; }

contract MultiLayerOpt {
    data: Inner?;

    init() {
        self.data = null;
    }
}