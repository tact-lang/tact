struct Large {
    a: Int;
    b: String;
    c: Bool;
    d: Int;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
    k: String;
    l: Bool;
    m: Int;
    n: String;
    o: Bool;
}

contract Test {
    val: Large = Large{
        a: 1,
        b: "b",
        c: true,
        d: 2,
        e: "e",
        f: false,
        g: 3,
        h: "h",
        i: true,
        j: 4,
        k: "k",
        l: false,
        m: 5,
        n: "n",
        o: true,
    };
    
    receive() {}
}