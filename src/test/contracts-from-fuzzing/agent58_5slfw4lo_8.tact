struct Nested {
    a: Int;
    b: Bool?;
}

struct WithMap {
    dict: map<Int, Nested>;
    note: String;
}

contract TestContract {
    receive() {
        let m: map<Int, Nested> = emptyMap();
        m.set(1, Nested { a: 10, b: true });
        m.set(2, Nested { a: 20, b: null });
        let w: WithMap = WithMap { dict: m, note: "optional map test" };
    }
}
