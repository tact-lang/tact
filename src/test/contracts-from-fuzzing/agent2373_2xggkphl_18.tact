struct ComposePtrs {
    ptr1: Cell;
    ptr2: Cell;
    ptr3: Cell;
    ptr4: Cell;
}

contract ManyRefs {
    cptrs: ComposePtrs;

    init() {
        let c = emptyCell();
        self.cptrs = ComposePtrs{ ptr1:c, ptr2:c, ptr3:c, ptr4:c };
    }
}