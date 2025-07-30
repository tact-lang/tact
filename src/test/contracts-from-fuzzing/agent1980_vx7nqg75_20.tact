struct Struct1 {
    a: Int;
}

struct Struct2 {
    b: Bool;
    inner: Struct1;
}

struct Struct3 {
    s2: Struct2;
    c: String;
}

contract FlatDeepTest {
    s3: Struct3;

    init() {
        self.s3 = Struct3{
            s2: Struct2{ b: true, inner: Struct1{ a: 17 } },
            c: "end"
        };
    }
}