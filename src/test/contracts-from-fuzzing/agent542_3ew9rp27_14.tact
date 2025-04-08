struct Level1 {
    foo: Int;
}
struct Level2 {
    bar: Level1?;
}
struct Level3 {
    baz: Level2?;
}

contract DeepOptContract {
    value: Level3;

    init() {
        self.value = Level3{
            baz: Level2{
                bar: Level1{ foo: 777 }
            }
        };
    }
}