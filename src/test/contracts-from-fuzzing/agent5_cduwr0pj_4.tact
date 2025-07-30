struct Nested {
    x: Int;
}

struct Holder {
    s: Nested?;
}

contract TestContract {
    data: Holder = Holder{ s: null };
}
