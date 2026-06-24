struct OptCell {
    val: Cell?;
    flag: Bool;
}

contract TestContract {
    value: OptCell;

    init() {
        self.value = OptCell{
            val: null,
            flag: true
        };
    }
}