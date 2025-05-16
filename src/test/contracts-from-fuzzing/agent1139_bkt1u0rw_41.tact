struct Layer1 {
    l2: Layer2?;
}
struct Layer2 {
    l3: Layer3?;
}
struct Layer3 {
    l4: Layer4?;
}
struct Layer4 {
    intVal: Int;
}

contract MultiLayerNestedOpts {
    val: Layer1?;

    init() {
        self.val = null;
    }
}