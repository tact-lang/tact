struct IntAndStrings {
    num1: Int;
    str1: String;
    num2: Int;
    str2: String;
    flag: Bool;
}

contract TestContract {
    data: IntAndStrings;

    init() {
        self.data = IntAndStrings{
            num1: 5,
            str1: "first",
            num2: 10,
            str2: "second",
            flag: true
        };
    }
}
