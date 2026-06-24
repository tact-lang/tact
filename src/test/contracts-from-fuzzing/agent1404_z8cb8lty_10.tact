struct OptStruct {
    str: String?;
    int: Int?;
    bool: Bool?;
}

struct Wrapper {
    os: OptStruct;
}

contract OptStructStorage {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            os: OptStruct{
                str: null,
                int: null,
                bool: null,
            }
        };
    }
}
