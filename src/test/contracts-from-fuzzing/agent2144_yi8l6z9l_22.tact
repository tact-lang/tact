struct ChildStruct {
    val: Int;
}

contract OptionalStructField {
    child: ChildStruct?;

    init() {
        self.child = ChildStruct{ val: 7 };
    }
}
