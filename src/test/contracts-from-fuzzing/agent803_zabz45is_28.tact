struct S {
    id: Int;
    name: String;
}

contract DefaultsOverwrite {
    val: S;
    init() {
        self.val = S{
            name: "abc",
            id: 123
        };
    }
}