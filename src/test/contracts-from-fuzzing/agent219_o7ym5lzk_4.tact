struct Inner1 {
    f1: Int;
    f2: Bool;
}

struct Inner2 {
    f3: String;
    f4: Int?;
    f5: Bool?;
}

struct Outer {
    inner1: Inner1;
    inner2: Inner2;
    flag: Bool;
    optText: String?;
}

contract MultiStructFields {
    outerStorage: Outer;

    init() {
        self.outerStorage = Outer{
            inner1: Inner1{ f1: 5, f2: true },
            inner2: Inner2{ f3: "hi", f4: null, f5: null },
            flag: false,
            optText: null
        };
    }
}