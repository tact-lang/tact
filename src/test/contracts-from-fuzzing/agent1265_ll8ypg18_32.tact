// Optional top-level persistent variable, assigned null
struct Example {
    f: Int;
}

contract NullAtTop {
    data: Example?;

    init() {
        self.data = null;
    }
}