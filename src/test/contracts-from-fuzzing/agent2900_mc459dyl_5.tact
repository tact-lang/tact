struct Sub {
    flag: Bool;
    note: String;
}

contract ManyFields {
    int1: Int = 1;
    int2: Int = 2;
    int3: Int = 3;
    b1: Bool = true;
    b2: Bool = false;
    str1: String = "one";
    str2: String = "two";
    s: Sub;

    init() {
        self.s = Sub{
            flag: true,
            note: "hello",
        };
    }
}
