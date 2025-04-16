struct Layer3 {
    str: String;
}

struct Layer2 {
    l3: Layer3;
    intVal: Int;
}

struct Layer1 {
    l2a: Layer2;
    l2b: Layer2;
}

contract TwoLayer2Nested {
    field: Layer1;

    init() {
        self.field = Layer1{
            l2a: Layer2{l3:Layer3{str:"x"},intVal:1},
            l2b: Layer2{l3:Layer3{str:"y"},intVal:2}
        };
    }
}