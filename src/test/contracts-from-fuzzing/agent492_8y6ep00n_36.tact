contract Foo {
    a: Int;
    b: Int = 1;
    c: Bool;
    d: Bool = false;
    e: String;
    f: String = "x";

    init() {
        self.a = 10;
        self.c = true;
        self.e = "hello";
    }
}