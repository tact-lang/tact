struct NestedOptionals {
    x: Int?;
    y: String?;
    z: Bool?;
}

struct Wrapper {
    val: NestedOptionals;
}

contract OptionWrap {
    content: Wrapper;

    init() {
        self.content = Wrapper{
            val: NestedOptionals{x: null, y: null, z: null}
        };
    }
}