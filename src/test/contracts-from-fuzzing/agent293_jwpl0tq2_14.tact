struct ManyOptionals {
    o1: Int?;
    o2: Int?;
    o3: Bool?;
    o4: Bool?;
    o5: Address?;
    o6: Address?;
}

contract ManyOptionalsStorage {
    val: ManyOptionals;

    init() {
        self.val = ManyOptionals{
            o1: null, o2: null, o3: null,
            o4: null, o5: null, o6: null
        };
    }
}