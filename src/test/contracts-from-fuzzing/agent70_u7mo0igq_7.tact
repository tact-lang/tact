struct SubStruct {
    v: Int;
}

struct OuterStruct {
    s: SubStruct;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            s: SubStruct{v: 42}
        };
    }
}