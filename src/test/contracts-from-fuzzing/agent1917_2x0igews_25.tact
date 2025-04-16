struct InnerOptInt {
    number: Int?;
}

contract NestedSingleOpt {
    val: InnerOptInt;

    init() {
        self.val = InnerOptInt{number: null};
    }
}
