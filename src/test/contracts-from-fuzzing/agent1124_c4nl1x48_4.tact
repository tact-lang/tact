struct Inner { x: Int; y: Bool; }

struct Outer { coord: Inner; message: String; }

contract DeepNestedStorage {
    data: Outer;

    init() {
        self.data = Outer{
            coord: Inner{ x: 7, y: true },
            message: "deep"
        };
    }
}