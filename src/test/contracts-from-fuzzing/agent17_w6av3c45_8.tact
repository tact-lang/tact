struct OptionalDeep {
    child: Child?;
}

struct Child {
    grandchild: Grandchild?;
}

struct Grandchild {
    val: Int;
    msg: String;
}

contract OptDeepNest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            child: null
        };
    }
}