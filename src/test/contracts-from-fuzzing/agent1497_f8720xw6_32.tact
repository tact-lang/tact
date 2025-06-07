// Deep optional wrapping chain on contract persistent field
contract TestContract {
    deepOpt: Inner? = null;
}

struct Inner {
    nested: Sub?;
}

struct Sub {
    val: Int;
}