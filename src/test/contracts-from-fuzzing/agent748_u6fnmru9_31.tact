// Struct with larger nested optional with multiple fields
struct ManyFields {
    a: Int;
    b: Bool;
    s: String;
    addr: Address;
}

struct Outer {
    m: ManyFields?;
}

contract TestNestedOpt {
    state: Outer;

    init() {
        self.state = Outer { m: null };
    }
}