struct ManyOptions {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
    o5: Slice?;
    o6: String?;
}

contract ManyOptionalsTest {
    data: ManyOptions;

    init() {
        self.data = ManyOptions{
            o1: null, o2: null, o3: null, o4: null, o5: null, o6: null
        };
    }
}