struct OptionNested {
    nested: Int?;
    nested2: Bool?;
}

struct Container {
    embedded: OptionNested;
    flag: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            embedded: OptionNested{
                nested: null,
                nested2: true
            },
            flag: false
        };
    }
}