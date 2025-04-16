struct Inner {
    flag: Bool;
    info: String;
}

struct Middle {
    id: Int;
    inner: Inner;
}

struct Outer {
    count: Int;
    middle: Middle;
    note: String?;
}

contract TestContract(
    version: Int,
    label: String,
    outer: Outer,
    optOuter: Outer?
) {
    receive() {
        // dummy implementation
    }
}