struct Level3 {
    val: Int = 3;
    opt: Bool?; // defaults to null
}

struct Level2 {
    inner: Level3;
    flag: Bool = false;
}

struct Level1 {
    nested: Level2;
    name: String = "deep";
}

contract MultiNest {
    data: Level1 = Level1{
        nested: Level2{ inner: Level3{ val: 42, opt: null }, flag: true },
        name: "deep"
    };

    init() {}
}