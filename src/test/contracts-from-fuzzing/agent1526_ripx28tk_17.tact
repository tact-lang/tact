struct SequentialOptionals {
    o1: Int?;
    o2: Int?;
    o3: Int?;
    o4: Int?;
    o5: Int?;
}

contract ManySequentialOptionals {
    data: SequentialOptionals;

    init() {
        self.data = SequentialOptionals{
            o1: null,
            o2: 2,
            o3: null,
            o4: 4,
            o5: null,
        };
    }
}