struct Inner {
    val: Int?; // implicitly null
}

struct Outer {
    inside: Inner;
}

contract ImplicitNullNestedOptional {
    field: Outer = Outer{inside: Inner{}};
}