struct A {
    x: Int; 
    y: Bool;
}

contract OptionalTopLevel {
    optA: A?;

    init() {
        self.optA = null;
    }
}