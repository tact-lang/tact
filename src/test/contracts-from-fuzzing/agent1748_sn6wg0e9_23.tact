struct ArrayLike {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
}

contract TestContract {
    item: ArrayLike;

    init() {
        self.item = ArrayLike{ i1: 1, i2: 2, i3: 3, i4: 4, i5: 5 };
    }
}