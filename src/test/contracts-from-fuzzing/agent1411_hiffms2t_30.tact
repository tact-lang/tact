// test struct in persistent storage with remaining slice serialization
struct SliceHolder {
  head: Int;
  tail: Slice as remaining;
}

contract TestContract {
    data: SliceHolder;
    init() {
        self.data = SliceHolder{
            head: 42,
            tail: emptyCell().asSlice()
        };
    }
}