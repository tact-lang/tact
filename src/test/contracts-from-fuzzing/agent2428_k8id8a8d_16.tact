struct Container {
    a: Int as uint64;
    b: Bool?;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract TestContract(
    data: Container,
    flag: Bool?
) {}