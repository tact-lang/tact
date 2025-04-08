struct Inner {
    intVal: Int;
    optBool: Bool?;
    str: String;
    optInt: Int?;
}

struct Outer {
    nested: Inner;
    info: String?;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{
                intVal: 1,
                optBool: null,
                str: "abc",
                optInt: null,
            },
            info: null,
            flag: true,
        };
    }

    receive() {}
}