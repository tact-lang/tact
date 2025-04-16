struct Wrapped {
    intVal: Int;
}

contract OptionalStructHolder {
    maybeS: Wrapped?;

    init() {
        self.maybeS = null;
    }
}