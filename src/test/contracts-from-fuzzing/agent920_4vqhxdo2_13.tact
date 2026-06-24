struct BigNested {
    s1: Int;
    s2: Bool;
    s3: Inner1;
    s4: Inner2;
}

struct Inner1 {
    k: Int;
    flag: Bool;
}

struct Inner2 {
    data: String;
    opt: Bool?;
}

contract ComplexNested {
    data: BigNested;

    init() {
        self.data = BigNested {
            s1: 777,
            s2: true,
            s3: Inner1 { k: 123, flag: false },
            s4: Inner2 { data: "foo", opt: null }
        };
    }
}