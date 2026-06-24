message(42) M { x: Int }

contract MessageAsField {
    mfield: M;

    init() {
        self.mfield = M{ x: 5 };
    }
}
