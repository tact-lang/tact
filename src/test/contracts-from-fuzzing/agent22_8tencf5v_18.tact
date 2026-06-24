// Optional persistent storage slot with deeply nested optional structs
struct Bottom {
    value: Int?;
}
struct Middle {
    bottom: Bottom?;
}
struct TopOpt {
    middle: Middle?;
}

contract OptDeepLevels {
    slot: TopOpt?;

    init() {
        self.slot = null;
    }
}