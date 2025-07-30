// optional with defaulted nested struct
struct Inner {
    foo: Int = 42;
}
struct Outer {
    bar: Inner?;
}

contract DFOpt {
    data: Outer;

    init() {
        self.data = Outer{ bar: null };
    }
}