// Struct containing embedded empty slice/cell by default
struct EmptyEmbed {
    s: Slice;
    c: Cell;
}

contract EmptyEmbedTest {
    val: EmptyEmbed;

    init() {
        self.val = EmptyEmbed{
            s: emptyCell().asSlice(),
            c: emptyCell()
        };
    }
}