contract ManyPrimitives {
    intVal: Int = 7;
    boolVal: Bool = true;
    strVal: String = "abc";

    init() {
        self.intVal = 1;
        self.boolVal = false;
        self.strVal = "def";
    }

    receive() {
        let _ = self.intVal;
        let _ = self.boolVal;
        let _ = self.strVal;
    }
}