struct OptionalDeep {
    sub: OptionalMid?;
}

struct OptionalMid {
    sub: OptionalLeaf?;
}

struct OptionalLeaf {
    val: Int?;
}

contract StorageTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            sub: OptionalMid{
                sub: OptionalLeaf{
                    val: 100
                }
            }
        };
    }
}
