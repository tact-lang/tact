// Optional struct inside contract, containing nested composite fields
struct SubStruct {
    intVal: Int;
    strVal: String?;
    boolVal: Bool?;
}

struct MainStruct {
    sub: SubStruct?;
    flag: Bool;
}

contract OptStructField {
    data: MainStruct?;

    init() {
        self.data = null;
    }
}