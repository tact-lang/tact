// Optional Slice deeply nested
struct Leaf { s: Slice? }
struct Mid { leaf: Leaf }
contract NestedOptSlice {
    field: Mid;
    init(){
        self.field = Mid{ leaf: Leaf{ s: null } };
    }
}