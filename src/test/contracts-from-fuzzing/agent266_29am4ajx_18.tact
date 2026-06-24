struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Bool?;
    o5: String?;
    o6: String?;
    o7: Address?;
    o8: Address?;
}

contract ManyOptionalFields {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1: null,
            o2: 2,
            o3: null,
            o4: true,
            o5: null,
            o6: "str",
            o7: null,
            o8: myAddress()
        };
    }
}