struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Slice?;
    o6: Address?;
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int;
}

contract ManyOptTest {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null,
            o6: null,
            f1: 123,
            f2: true,
            f3: "abc",
            f4: 456
        };
    }
}