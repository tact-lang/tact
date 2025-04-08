struct Child {
    x: Int;
    y: Bool;
}

contract DefaultsOnStruct {
    data: Child = Child{ x: 5, y: true };

    init() {
        self.data = Child{ x: 7, y: false };
    }
}