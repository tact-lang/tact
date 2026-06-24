struct Layer1 {
    i: Int?;
}

struct Layer2 {
    l1: Layer1?;
}

contract NestedNullable {
    val: Layer2;

    init() {
        self.val = Layer2{
            l1: null
        };
    }
}