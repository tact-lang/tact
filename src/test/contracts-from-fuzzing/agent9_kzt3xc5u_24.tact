struct InnerDefault {
    f: Int = 55;
}

contract DefInNested {
    val: InnerDefault;

    init() {
        self.val = InnerDefault{ f: 123 };
    }
}