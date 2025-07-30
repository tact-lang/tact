struct Sub {
    x: Int = 11;
    y: Int = 12;
    z: Bool = false;
}

struct MyData {
    name: String = "ok";
    sub: Sub;
    flag: Bool = true;
    num: Int = 99;
}

contract PartialDefaults {
    field: MyData = MyData{
        sub: Sub{},  // omit sub defaults
    };

    init() {}
}