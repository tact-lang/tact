// Compose nested struct with deeply nested optional reference containing optionals
struct Core {
    a: Int?;
    b: Bool?;
}

struct Box {
    core: Core?;
    label: String?;
}

contract DeepOptReference {
    inner: Box?;

    init() {
        self.inner = null;
    }
}
