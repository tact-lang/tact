struct Inner {
    optInt: Int?;
    flag: Bool;
    addr: Address;
    text: String;
}

contract StructStorage {
    s: Inner = Inner{
        optInt: null,
        flag: true,
        addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        text: "Hello"
    };

    init() {}
}