struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    o4: Cell?;
    o5: Slice?;
    o6: Address?;
}

contract TestContract {
    data: ManyOptionals;

    init() {
        self.data = ManyOptionals{
            o1: null,
            o2: null,
            o3: null,
            o4: null,
            o5: null,
            o6: null,
        };
    }

    receive() {
        self.data = self.data;
    }
}