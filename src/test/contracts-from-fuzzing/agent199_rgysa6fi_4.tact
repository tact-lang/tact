struct Level3 { value: Int; }
struct Level2 { nested: Level3; }
struct Level1 { inner: Level2; }

contract MultiLevelNested {
    payload: Level1;

    init() {
        self.payload = Level1{
            inner: Level2{
                nested: Level3{
                    value: 99,
                },
            },
        };
    }
}
