struct Level3 {
    leaf: String;
}

struct Level2 {
    mid: Level3;
    value: Int;
}

struct Level1 {
    header: Bool;
    inner: Level2;
}

contract DeepNestedStructs {
    data: Level1 = Level1{
        header: true,
        inner: Level2{
            mid: Level3{
                leaf: "Done"
            },
            value: 7
        }
    };

    receive() {
        self.data.inner.mid.leaf;
    }
}