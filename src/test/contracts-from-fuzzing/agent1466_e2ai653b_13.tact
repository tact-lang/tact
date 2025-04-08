struct Container {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedOptTest {
    val: Container = Container{ a: 1, b: false, c: "x", d: null, e: null, f: null };

    init() {
        self.val = Container{ a: 2, b: true, c: "y", d: 3, e: false, f: "z" };
    }
}
