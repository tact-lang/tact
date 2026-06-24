struct ManyOptionals {
    o1: Int?;
    o2: Bool?;
    o3: Int?;
    o4: Bool?;
    v1: Int;
    v2: Bool;
}

contract OptionalMix {
    storage: ManyOptionals;

    init() {
        self.storage = ManyOptionals{
            o1: null, o2: false, o3: 777, o4: null,
            v1: 42, v2: true,
        };
    }
}