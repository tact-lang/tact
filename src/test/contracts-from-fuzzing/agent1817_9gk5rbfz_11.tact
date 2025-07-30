struct SubStructA {
    num: Int;
}

struct SubStructB {
    str: String;
}

struct Container {
    optA: SubStructA?;
    optB: SubStructB?;
    flag: Bool;
}

contract OptionalStructFields {
    val: Container;

    init() {
        self.val = Container{
            optA: null,
            optB: null,
            flag: false,
        };
    }
}
