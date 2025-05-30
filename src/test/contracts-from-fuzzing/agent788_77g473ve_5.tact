struct Level3 {
    x: Int;
    y: Bool;
}

struct Level2 {
    a: Int?;
    b: Bool;
    nested: Level3;
}

struct Level1 {
    main: Int;
    option: Level2?;
}

contract MultiOptional {
    val: Level1;

    init() {
        self.val = Level1{
            main: 100,
            option: Level2{
                a: null,
                b: true,
                nested: Level3{ x: 5, y: false }
            }
        };
    }
}
