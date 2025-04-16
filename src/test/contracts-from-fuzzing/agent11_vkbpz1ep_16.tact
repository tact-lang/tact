struct SubStruct {
    val: Int?;
}

struct MainStruct {
    sub: SubStruct?;
}

contract TestContract {
    m: MainStruct;

    init() {
        self.m = MainStruct{
            sub: null
        };
    }
}