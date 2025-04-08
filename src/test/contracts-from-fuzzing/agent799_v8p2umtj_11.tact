struct BasicStruct {
    foo: Int;
}

contract ManyStructs {
    sf1: BasicStruct;
    sf2: BasicStruct;
    sf3: BasicStruct;
    sf4: BasicStruct;

    init() {
        self.sf1 = BasicStruct{foo: 1};
        self.sf2 = BasicStruct{foo: 2};
        self.sf3 = BasicStruct{foo: 3};
        self.sf4 = BasicStruct{foo: 4};
    }
}