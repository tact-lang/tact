struct Recursive1 {
    inner: Recursive2?;
}

struct Recursive2 {
    x: Int;
}

contract TestContract {
    field: Recursive1;

    init() {
        self.field = Recursive1{ inner: Recursive2{ x: 10 } };
    }
}