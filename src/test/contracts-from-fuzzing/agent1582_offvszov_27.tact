struct A1 {
    a: Int?;
}

struct B1 {
    b: A1?;
}

contract OptionalChain {
    val: B1 = B1 {
        b: null
    };

    receive() {}
}