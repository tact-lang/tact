struct OptOne {
    a: Int?;
}
struct OptTwo {
    a: Int?;
}
struct OptThree {
    a: Int?;
}

contract ManyOptStructs {
    s1: OptOne?;
    s2: OptTwo?;
    s3: OptThree?;

    init() {
        self.s1 = null;
        self.s2 = null;
        self.s3 = null;
    }
}