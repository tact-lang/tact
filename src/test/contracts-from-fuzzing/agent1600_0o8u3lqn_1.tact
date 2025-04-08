struct SingleFieldOptional {
    val: Int?;
}

contract TestContract {
    sfo: SingleFieldOptional;

    init() {
        self.sfo = SingleFieldOptional{val: null};
    }
}