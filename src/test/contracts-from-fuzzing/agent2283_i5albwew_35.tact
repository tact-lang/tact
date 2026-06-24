struct Layer3 {
    x: Int;
}

struct Layer2 {
    l: Layer3;
}

contract NestedSmall {
    val: Layer2;

    init() {
        self.val=Layer2{l:Layer3{x:5}};
    }
}
