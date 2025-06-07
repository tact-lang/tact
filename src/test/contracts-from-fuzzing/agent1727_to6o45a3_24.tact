// struct containing only primitives
struct Simple {
    a: Int = 1;
    b: Bool = false;
    s: String = "hi";
}

// contract with persistent struct field assigned default
contract StructPrimitive {
    data: Simple = Simple{};

    receive() {
        self.data = Simple{a: 42, b: true, s: "bye"};
    }
}