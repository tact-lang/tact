struct Base {
    val: Int;
}

struct Container {
    branch: Base?;
    text: String;
}

contract Test {
    field: Container?;
    init() {
        self.field = null;
    }
}