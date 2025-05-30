struct OptionalString {
    val: String?;
}

struct Container {
    optStr: OptionalString;
    flag: Bool?;
    count: Int;
}

contract ComboOptional {
    data: Container;

    init() {
        self.data = Container{
            optStr: OptionalString{ val: null },
            flag: null,
            count: 77,
        };
    }
}