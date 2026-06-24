struct SubStruct1 { f1: Int; }
struct SubStruct2 { f2: Bool; }

struct Container {
    sub1: SubStruct1?;
    sub2: SubStruct2?;
}

contract OptNestedStructs {
    container: Container;

    init() {
        self.container = Container{
            sub1: null,
            sub2: null
        };
    }
}