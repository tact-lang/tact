struct OptionalInt {
    i: Int?; 
}

contract NoneAssignedOptional {
    x: OptionalInt; 
    init() {
        self.x = OptionalInt{ i: null };
    }
    receive() {
        let _ = self.x.i;
    }
}