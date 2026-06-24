struct Level3 { foo: Int; bar: Bool }
struct Level2 { baz: Level3; qux: Level3? }
struct Level1 { a: Level2; b: Level2? }

contract DeepNestTest {
    field: Level1 = Level1{
        a: Level2{baz: Level3{foo: 1, bar: true}, qux: null},
        b: null
    };

    init() {
        self.field = Level1{
            a: Level2{baz: Level3{foo: 10, bar: false}, qux: Level3{foo: 11, bar: true}},
            b: Level2{baz: Level3{foo: 20, bar: false}, qux: null}
        };
    }
}