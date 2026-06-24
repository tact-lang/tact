struct BoolInt {
    b: Bool;
    i: Int;
}

struct NestedBoolInt {
    x: Int;
    nested: BoolInt;
}

contract NestedBoolIntContract {
    data: NestedBoolInt = NestedBoolInt{x:1, nested:BoolInt{b:true, i:42}};
    receive() {
        let _ = self.data.nested.i;
    }
}