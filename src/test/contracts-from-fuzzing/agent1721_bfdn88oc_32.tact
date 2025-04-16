// struct with optional slice field, stored as contract persistent data
struct SliceWrapper { s: Slice?; }
contract OptionalSliceInStructTest {
    val: SliceWrapper;
    init() {
        self.val = SliceWrapper { s: null };
    }
}
