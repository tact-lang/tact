// Optional top-level struct (optional contract variable)
struct Simple {
    a: Int;
    b: Bool;
}

contract OptionalTop {
    data: Simple?;
    init() {
        self.data = Simple{
            a:5, b:true
        };
    }
}