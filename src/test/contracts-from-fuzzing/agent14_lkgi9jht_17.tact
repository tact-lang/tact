struct Level1 {
    a: Int;
    b: String?;
}
struct Level2 {
    inner: Level1;
    flag: Bool;
}
struct Level3 {
    nested: Level2;
    label: String;
    opt: Bool?;
}

contract TestContract {
    lvl3: Level3;

    init() {
        self.lvl3 = Level3{
            nested: Level2{
                inner: Level1{ a: 42, b: null },
                flag: true,
            },
            label: "l3",
            opt: null,
        };
    }
}