// Deep optional nesting (not nested optionals, but optionals inside nested structs)
struct Three {
    c: Int?;
}

struct Two {
    b: Three?;
}

struct One {
    a: Two?;
}

contract TestContract {
    data: One;

    init() {
        self.data = One{
            a: null
        };
    }
}