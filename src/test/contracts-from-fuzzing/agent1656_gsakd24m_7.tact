struct OptionalInner {
    name: String?;
    flag: Bool?;
}

struct Container {
    data: OptionalInner;
}

contract OptionalFields {
    rec: Container;

    init() {
        self.rec = Container {
            data: OptionalInner {
                name: null,
                flag: null
            }
        };
    }
}