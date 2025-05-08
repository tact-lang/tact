struct HasOptionalStruct {
    s: Inner?
}

struct Inner {
    x: Int
}

contract Test {
    receive() {}
}