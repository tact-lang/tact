struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Address?;
    o5: Int?;
    o6: Bool?;
    o7: String?;
    o8: Address?;
    o9: Int?;
    o10: Bool?;
}

contract BigOptional {
    data: ManyOptionals;
    init() {
        self.data = ManyOptionals{
            o1: null,o2: null,o3: null,o4: null,o5: null,
            o6: null,o7: null,o8: null,o9: null,o10: null
        };
    }
    receive() {
        if (self.data.o10 != null) {
            let _ = self.data.o10!!;
        }
    }
}