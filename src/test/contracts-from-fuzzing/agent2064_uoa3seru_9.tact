struct Mixed {
    n: Int;
    s: String;
    b: Bool;
}

contract MultiFields {
    f1: Mixed = Mixed{ n: 1, s: "a", b: true };
    f2: Mixed = Mixed{ n: 2, s: "b", b: false };
    f3: Mixed = Mixed{ n: 3, s: "c", b: true };
    f4: Mixed = Mixed{ n: 4, s: "d", b: false };
}
