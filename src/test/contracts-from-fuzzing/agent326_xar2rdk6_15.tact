struct SubStruct {
    x: Int = 1;
    y: Bool = true;
    z: String = "abc";
}

struct Wrap {
    sub1: SubStruct;
    sub2: SubStruct;
    optSub: SubStruct?;
}

contract DefaultsAndOptionals {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{
            sub1: SubStruct{},
            sub2: SubStruct{},
            optSub: null,
        };
    }

    receive() {
        self.wrap = self.wrap;
    }
}