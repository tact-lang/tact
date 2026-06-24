struct HasBool {
    flag: Bool;
}

struct HasInt {
    number: Int;
}

struct HasString {
    text: String;
}

struct Container {
    a: HasBool;
    b: HasInt;
    c: HasString;
}

contract MultiStructContainer {
    data: Container;

    init() {
        self.data = Container{
            a: HasBool{flag: false},
            b: HasInt{number: 5},
            c: HasString{text: "abc"},
        };
    }
}