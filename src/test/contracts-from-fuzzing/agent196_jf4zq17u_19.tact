struct SDefault {
    a: Int = 0;
    b: Int = 1;
}

contract StructReassignInit {
    val: SDefault;

    init() {
        self.val = SDefault{ a: 42, b: 43 };
    }
}