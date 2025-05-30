struct Inner { val: Int?; }

contract NestedOptional {
    info: Inner?;

    init() {
        self.info = Inner{ val: 5 };
    }
}
