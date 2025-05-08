struct Inner {
    x: Int? as uint8;
    y: Bool?;
}

struct Middle {
    inner: Inner?;
    flag: Bool;
}

contract TestContract(
    middle: Middle?,
    amount: Int as uint32,
    note: String?
) {
    // using only contract parameters, no init
}