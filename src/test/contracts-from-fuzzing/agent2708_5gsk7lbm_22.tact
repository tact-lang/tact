struct DoublyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    n: Int;
    flag: Bool;
}

contract NestedStuff {
    data: DoublyNested;
    init() {
        self.data = DoublyNested{
            inner: InnerStruct{n:7, flag:true}
        };
    }
}