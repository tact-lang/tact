struct ManyLevels {
    s1: String;
    inner: Inner1;
}

struct Inner1 {
    s2: String;
    inner2: Inner2;
}

struct Inner2 {
    s3: String;
    flag: Bool;
}

contract DeepChain {
    data: ManyLevels;

    init() {
        self.data = ManyLevels{
            s1: "a",
            inner: Inner1{
                s2: "b",
                inner2: Inner2{
                    s3: "c",
                    flag: true,
                }
            }
        };
    }
}
