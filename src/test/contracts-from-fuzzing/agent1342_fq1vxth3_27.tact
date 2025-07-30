struct Level2 { foo: String; }
struct Level1 { inner: Level2 }

contract TwoLevels {
    field: Level1;

    init() {
        self.field = Level1{
            inner: Level2{ foo: "abc" }
        };
    }
}