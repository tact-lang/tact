// Optional whole struct field in contract, assignment null, inner with defaults/optional
struct InnerOptDef {
    a: Int = 5;
    b: Bool?;
}

contract TestContract {
    state: InnerOptDef?;

    init() {
        self.state = null;
    }
}