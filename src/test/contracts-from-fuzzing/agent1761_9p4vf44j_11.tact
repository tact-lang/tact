struct SerializeBools {
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    flag4: Bool;
    flag5: Bool;
    flag6: Bool;
}

contract TestContract {
    data: SerializeBools;

    init() {
        self.data = SerializeBools{
            flag1: true,
            flag2: false,
            flag3: true,
            flag4: true,
            flag5: false,
            flag6: false
        };
    }
}