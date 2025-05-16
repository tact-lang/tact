struct SubStruct {
    s: String;
    b: Bool;
    i: Int;
}

struct Outer {
    st1: SubStruct;
    st2: SubStruct;
    flag: Bool;
}

contract NestedRepeated {
    data: Outer;

    init() {
        self.data = Outer{
            st1: SubStruct{ s: "a", b: true, i: 1 },
            st2: SubStruct{ s: "b", b: false, i: 2 },
            flag: true,
        };
    }
}