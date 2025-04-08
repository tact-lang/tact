struct SimpleStruct {
    x: Int;
    y: Int;
}

contract MultipleStructs {
    coord1: SimpleStruct;
    coord2: SimpleStruct;
    coord3: SimpleStruct;

    init() {
        self.coord1 = SimpleStruct{x: 1, y: 2};
        self.coord2 = SimpleStruct{x: 3, y: 4};
        self.coord3 = SimpleStruct{x: 5, y: 6};
    }
}