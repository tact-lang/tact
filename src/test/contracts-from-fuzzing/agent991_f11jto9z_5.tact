struct Info {
    x: Int?;
    y: Bool?;
}

struct Wrapper {
    info: Info?;
    label: String?;
}

contract OptNestedStruct {
    state: Wrapper;

    init() {
        self.state = Wrapper{
            info: null,
            label: null
        };
    }
}