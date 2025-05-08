// Compose deeply nested optional structs with optionals in them, assign null at outermost
struct Base { x: Int?; }
struct Next { b: Base?; y: Int; }
struct Up { n: Next?; z: Bool; }

contract DeepNullAssignment {
    data: Up?;

    init() {
        self.data = null;
    }
}