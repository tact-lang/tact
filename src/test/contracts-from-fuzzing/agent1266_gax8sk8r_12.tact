struct Params {
    foo: Int = 123;
    bar: String? = null;
}

contract StorageParams(
    conf: Params,
    count: Int as uint32,
    flag: Bool
) {}