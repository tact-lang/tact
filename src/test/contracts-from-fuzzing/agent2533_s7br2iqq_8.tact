struct Params {
    a: Int;
    b: Bool;
    c: Address;
    d: Slice;
    e: Cell;
    f: String;
    g: Int?;
    h: String?;
    i: Bool?;
}

contract Foo(
    param: Params,
) {}