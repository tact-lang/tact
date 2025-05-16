struct DeepString {
    text: String;
}

struct WrapOptional {
    deep: DeepString?;
}

contract NestedOptionals {
    content: WrapOptional;

    init() {
        self.content = WrapOptional { deep: null };
    }
}
