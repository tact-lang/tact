struct Inner {
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
}

struct Outer {
    in1: Inner;
    in2: Inner;
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{
            in1: Inner{
                s1: "a",
                s2: "b",
                s3: "c",
                s4: "d",
                s5: "e",
            },
            in2: Inner{
                s1: "f",
                s2: "g",
                s3: "h",
                s4: "i",
                s5: "j",
            },
        };
    }
}