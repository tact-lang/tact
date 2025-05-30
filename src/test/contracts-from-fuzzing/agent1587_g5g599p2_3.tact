struct A {
    str: String;
    b: Bool;
    num: Int;
    flag: Bool?;
    optStr: String?;
}

contract ManyTypes {
    item: A;

    init() {
        self.item = A{
            str: "test",
            b: true,
            num: 41,
            flag: null,
            optStr: null,
        };
    }
}