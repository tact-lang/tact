struct StructA { f: Int }

contract AssignStructThenField {
    val: StructA;

    init() {
        self.val = StructA{ f: 5 };
        self.val.f = 10;
    }
}