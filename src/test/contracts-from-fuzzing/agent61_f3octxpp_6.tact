struct Sub {
    foo: Int;
}

struct BigNested {
    s1: Sub;
    s2: Sub;
    s3: Sub;
    s4: Sub;
    s5: Sub;
}

contract ManyNestedStructs {
    val: BigNested;

    init() {
        self.val = BigNested{
            s1: Sub{ foo: 1 },
            s2: Sub{ foo: 2 },
            s3: Sub{ foo: 3 },
            s4: Sub{ foo:4 },
            s5: Sub{ foo:5 }
        };
    }
}