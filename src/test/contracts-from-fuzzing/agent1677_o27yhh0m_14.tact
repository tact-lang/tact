struct SubStruct {
    flag: Bool;
    num: Int;
}

struct Container {
    one: SubStruct;
    two: SubStruct;
}

contract NestedMultipleStructs {
    st: Container;

    init() {
        self.st = Container{
            one: SubStruct{flag:true, num:1},
            two: SubStruct{flag:false, num:2}
        };
    }
}