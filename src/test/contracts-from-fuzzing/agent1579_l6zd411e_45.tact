contract DifferentTypes {
    intVal: Int = 7;
    boolVal: Bool = true;
    stringVal: String = "hi";

    receive() {
        self.intVal += 1;
    }
}