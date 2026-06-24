struct Fancy {
    s: String = "hey";
    addr: Address;
    opt1: Bool?;
    opt2: Int?;
}

contract FancyTest {
    f: Fancy = Fancy{
        s: "yo",
        addr: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        opt1: null,
        opt2: null
    };

    init() {}
}