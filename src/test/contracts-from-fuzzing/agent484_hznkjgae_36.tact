struct Defaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

contract Commas {
    f: Defaults = Defaults{
        a: 2,
        b: true,
        c: "bye", // trailing comma allowed
    };
}