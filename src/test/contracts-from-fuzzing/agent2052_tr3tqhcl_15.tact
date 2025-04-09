struct StructWithManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Int?;
    o5: String?;
    o6: Bool?;
    o7: String?;
    o8: Int?;
}

contract ManyOptionalStructFields {
    val: StructWithManyOptionals;

    init() {
        self.val = StructWithManyOptionals{
            o1: null,
            o2: true,
            o3: null,
            o4: 42,
            o5: null,
            o6: null,
            o7: "hello",
            o8: null
        };
    }
}