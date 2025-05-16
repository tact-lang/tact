struct OptStruct {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    os: OptStruct;
    flag: Bool;
}

contract OptionalInStruct {
    value: Container;

    init() {
        self.value = Container{
            os: OptStruct{
                a: null,
                b: true,
                c: null
            },
            flag: false
        };
    }
}