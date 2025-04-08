struct Level3 {
    a: Int = 5;
    b: Bool? = null;
}

struct Level2 {
    l3: Level3?;
    x: String = "foo";
}

struct Level1 {
    l2: Level2;
}

contract ComboDeep {
    main: Level1;

    init() {
        self.main = Level1{
            l2: Level2{
                l3: Level3{},
                x: "bar"
            }
        };
    }
}
