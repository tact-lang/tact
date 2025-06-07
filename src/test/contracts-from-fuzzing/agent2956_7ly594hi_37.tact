struct NestingDefaults1 {
    a: Int = 1;
    b: NestingDefaults2;
}

struct NestingDefaults2 {
    c: String = "dog";
    d: Bool = false;
}

contract NestDef {
    val: NestingDefaults1;

    init() {
        self.val = NestingDefaults1{
            b: NestingDefaults2{},
        };
    }
}
