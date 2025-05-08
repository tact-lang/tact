struct Wrap {
    value: Int;
}

contract DefaultInit {
    field1: Wrap;
    field2: Wrap;
    field3: Wrap;

    init() {
        self.field1 = Wrap{value:1};
        self.field2 = Wrap{value:2};
        self.field3 = Wrap{value:3};
    }
}