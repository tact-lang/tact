struct NestedA {
    x: Int;
}

struct NestedB {
    y: Bool;
}

struct NestedC {
    z: String;
}

struct MixedNesting {
    na: NestedA;
    nb_opt: NestedB?;
    nc_opt: NestedC?;
    val: Int?;
    flag: Bool;
}

contract MixedNestedPersistence {
    data: MixedNesting;
    init() {
        self.data = MixedNesting{
            na: NestedA{ x: 10 },
            nb_opt: null,
            nc_opt: NestedC{ z: "world" },
            val: null,
            flag: true,
        };
    }
}