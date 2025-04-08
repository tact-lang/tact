struct Composable {
    a: Int;
    b: Int?;
}

struct WrapComposable {
    w: Composable;
}

contract NestedStructsFields {
    val: WrapComposable;

    init() {
        self.val = WrapComposable{ w: Composable{ a:1, b:null } };
    }
}