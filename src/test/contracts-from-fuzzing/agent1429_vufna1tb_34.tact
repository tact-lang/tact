struct NestedOptDefault {
    foo: Int? = 4;
}

contract NestedOptWithInit {
    data: NestedOptDefault;

    init() {
        self.data = NestedOptDefault{ foo: null };
    }
}
