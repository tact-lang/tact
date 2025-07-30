struct HasBool {
    b: Bool;
}

struct WrapHasBool {
    inner: HasBool;
}

contract NestedBoolTest {
    val: WrapHasBool;

    init() {
        self.val = WrapHasBool{inner:HasBool{b:true}};
    }
}
