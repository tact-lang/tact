// Struct where a field has 'as remaining' serialization
struct RemainStruct {
    a: Int;
    rest: Slice as remaining;
}

contract RemainTest {
    val: RemainStruct;

    init() {
        self.val = RemainStruct {
            a: 5,
            rest: emptyCell().asSlice()
        };
    }
}