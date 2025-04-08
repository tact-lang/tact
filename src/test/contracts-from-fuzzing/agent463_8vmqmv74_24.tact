struct Tiny {
    count: Int as uint3;   // 3-bit unsigned
    label: String;
}

contract TinyStore {
    data: Tiny;

    init() {
        self.data = Tiny{ count: 5, label: "Hello" };
    }
}