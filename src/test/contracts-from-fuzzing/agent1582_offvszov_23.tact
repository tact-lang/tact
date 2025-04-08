struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract ListOrderTest {
    f1: Int = 10;
    f2: S = S{
        a: 1,
        b: true,
        c: "c"
    };
    f3: Bool = false;
    f4: String = "abc";

    receive() {}
}