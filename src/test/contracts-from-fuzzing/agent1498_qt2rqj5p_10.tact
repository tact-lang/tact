struct NestedStringOptional {
    name: String?;
    info: InfoStruct;
}

struct InfoStruct {
    desc: String?;
    flag: Bool;
}

contract TestContract {
    data: NestedStringOptional;

    init() {
        self.data = NestedStringOptional{
            name: null,
            info: InfoStruct{
                desc: null,
                flag: true
            }
        };
    }
}
