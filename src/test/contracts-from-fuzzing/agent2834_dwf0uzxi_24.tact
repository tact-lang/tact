struct Info {
    id: Int;
    label: String;
    remark: String?;
}

struct Holder {
    info: Info;
    description: String?;
}

contract NestedOptionals2 {
    storage: Holder?;

    init() {
        self.storage = null;
    }
}