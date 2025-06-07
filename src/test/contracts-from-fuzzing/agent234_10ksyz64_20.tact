struct SerializeStruct {
    small: Int as uint8;
    large: Int as int256;
    defaultInt: Int;
}

contract SerializeStructContract {
    s: SerializeStruct;

    init() {
        self.s = SerializeStruct{
            small: 255,
            large: -1,
            defaultInt: 100
        };
    }
}