struct Mix {
    flag: Bool;
    count: Int;
    addr: Address;
    txt: String;
}

contract V {
    m: Mix = Mix{
        flag: true,
        count: 1,
        addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        txt: "hi"
    };
}