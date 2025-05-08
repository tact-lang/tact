struct Nested {
    a: Int = 7;
    b: String?;
}

struct Container {
    n: Nested;
    c: Bool;
}

contract TestContract {
    s: Container = Container{ n: Nested{}, c: true };

    init() {
        self.s = Container{ n: Nested{ b: "test" }, c: false };
    }
}