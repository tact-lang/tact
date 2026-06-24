struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    inner: Inner;
    label: String?;
}

contract NestedOptionals {
    data: Outer = Outer{ inner: Inner{ x: 123, y: null }, label: null };
}