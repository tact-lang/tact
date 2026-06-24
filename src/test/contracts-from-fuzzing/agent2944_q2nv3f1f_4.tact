struct DeepOptionals {
    nest1: Int?;
    nest2: Bool?;
    nest3: String?;
}

struct HighLevelWrapper {
    deep: DeepOptionals;
    label: String;
    flag: Bool;
}

contract NestedOptionals {
    store: HighLevelWrapper;

    init() {
        self.store = HighLevelWrapper{
            deep: DeepOptionals{
                nest1: 123,
                nest2: null,
                nest3: "hi"
            },
            label: "label",
            flag: false
        };
    }
}