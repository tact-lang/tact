// deeply nested optional chains forbidden, but single optional of nested struct should work
struct Level2 {
    val: Int;
}

struct Level1 {
    nested: Level2?;
}

contract TestContract {
    f: Level1;
    init() {
        self.f = Level1{
            nested: null,
        };
    }
}
