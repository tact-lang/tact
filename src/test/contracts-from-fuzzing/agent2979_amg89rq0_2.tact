struct Inner { x: Int; y: Bool; z: String; opt: Int?; }

contract StorageVar {
    data: Inner;

    init() {
        self.data = Inner{ x: 1, y: true, z: "hello", opt: null };
    }
}