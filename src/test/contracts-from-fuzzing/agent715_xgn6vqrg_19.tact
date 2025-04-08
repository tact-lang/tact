contract EmptyContract {}

struct SingleField {
    val: Int;
}

contract SingleContract {
    sf: SingleField;

    init() {
        self.sf = SingleField{ val: 99 };
    }
}