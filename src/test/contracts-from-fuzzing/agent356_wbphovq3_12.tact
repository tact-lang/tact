struct SubStruct {
    u: Int;
}

struct MainStruct {
    id: Int;
    sub: SubStruct;
}

contract DefaultInitTest {
    data: MainStruct;

    init() {
        self.data = MainStruct{
            id: 7,
            sub: SubStruct{ u: 8 }
        };
    }
}