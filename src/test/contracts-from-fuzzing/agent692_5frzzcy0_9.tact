struct NestedStringOpt {
    s: StrContainer?;
}

struct StrContainer {
    text: String;
}

contract TestContract {
    val: NestedStringOpt;

    init() {
        self.val = NestedStringOpt{
            s: null
        };
    }
}