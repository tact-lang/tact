struct ManyOptionalDeep {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct ContainerLevel {
    inner: ManyOptionalDeep?;
    flag: Bool;
}

contract DeepOptContainer {
    val: ContainerLevel;

    init() {
        self.val = ContainerLevel{inner: null, flag: true};
    }
}