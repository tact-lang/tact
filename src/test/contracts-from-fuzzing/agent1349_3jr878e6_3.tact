struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    o4: Cell?;
}

contract OptionalContract {
    data: ManyOptionals = ManyOptionals{
        o1: null,
        o2: true,
        o3: null,
        o4: null
    };

    receive() {
        self.data = ManyOptionals{
            o1: 1,
            o2: false,
            o3: null,
            o4: null
        };
    }
}