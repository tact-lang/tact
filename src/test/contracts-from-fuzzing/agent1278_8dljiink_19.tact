struct Inner {
    name: String?;
    age: Int;
}

struct Holder {
    info: Inner?;
    id: Int as uint64;
    flag: Bool;
}

contract TestContract(
    holder: Holder,
) {}