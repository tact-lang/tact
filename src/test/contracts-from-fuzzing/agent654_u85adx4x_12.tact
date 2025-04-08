struct InnerOption {
    x: Int?;
    y: Bool?;
}

struct OuterStruct {
    s: InnerOption;
    flag: Bool;
    value: Int;
}

contract TestContract {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            s: InnerOption{
                x: null,
                y: null,
            },
            flag: true,
            value: 100,
        };
    }
}