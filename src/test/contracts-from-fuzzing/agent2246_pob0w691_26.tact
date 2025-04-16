struct OptionalInt {
    a: Int?;
}

contract AssignNull {
    x: OptionalInt;

    init() {
        self.x = OptionalInt{a:null};
    }
}
