struct Inner {
    z: Int?;
}

struct Wrapper {
    inner: Inner;
}

contract OptionalNestedImplicit {
    val: Wrapper = Wrapper{inner: Inner{}};
}