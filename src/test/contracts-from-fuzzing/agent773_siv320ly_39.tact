struct EmptyInner {
    flag: Bool;
}

contract StructNullAssignment {
    val: EmptyInner;

    init() {
        self.val = EmptyInner{
            flag: false,
        };
    }
}