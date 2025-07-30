struct Recursive1 {
    inner: Recursive2?;
}

struct Recursive2 {
    more: Recursive3?;
}

struct Recursive3 {
    done: Bool?;
}

contract OptionalMultiLevel {
    foo: Recursive1;

    init() {
        self.foo = Recursive1{inner: null};
    }
}