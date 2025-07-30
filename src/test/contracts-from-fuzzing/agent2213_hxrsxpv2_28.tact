struct X {
    s: String;
}

struct Y {
    f: X;
}

contract NestedString {
    d: Y;

    init() {
        self.d = Y{
            f: X{
                s: "nested",
            },
        };
    }
}
