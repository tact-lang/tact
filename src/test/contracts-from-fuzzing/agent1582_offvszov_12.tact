struct S1 {
    i: Int;
    b: Bool;
    s: String;
}

struct S2 {
    s1: S1;
    s2: S1;
    s3: S1;
}

contract MultiStructs {
    main: S2 = S2{
        s1: S1{ i: 1, b: true, s: "x" },
        s2: S1{ i: 2, b: false, s: "y" },
        s3: S1{ i: 3, b: true, s: "z" },
    };

    receive() {}
}