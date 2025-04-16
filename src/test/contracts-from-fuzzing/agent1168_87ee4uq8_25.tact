struct Wrapper {
    num: Int;
    flag: Bool;
    text: String;
    sub: SubWrapper;
}

struct SubWrapper {
    a: Int;
    b: String;
    c: Bool;
}

contract MultipleTypes {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            num: 1,
            flag: true,
            text: "abc",
            sub: SubWrapper{ a: 5, b: "bcd", c: false }
        };
    }
}