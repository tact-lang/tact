struct X {
    val: Int;
    text: String;
}

struct Y {
    s1: X;
    s2: X;
    s3: X;
}

contract MultipleStructInstances {
    data: Y;

    init() {
        self.data = Y{
            s1: X{ val: 1, text: "one" },
            s2: X{ val: 2, text: "two" },
            s3: X{ val: 3, text: "three" },
        };
    }
}
