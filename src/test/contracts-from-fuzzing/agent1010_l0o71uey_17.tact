struct SubStruct {
    i: Int;
    flag: Bool;
}

struct Container {
    a: Int;
    sub: SubStruct;
    b: Int;
}

contract MiddleNested {
    cont: Container;
    init() {
        self.cont = Container{
            a: 2,
            sub: SubStruct{
                i: 3,
                flag: false,
            },
            b: 4,
        };
    }
}