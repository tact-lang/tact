contract TestContract {
    intVal: Int = 0;
    optInt: Int?;
    flag: Bool;

    init() {
        self.optInt = null;
        self.flag = true;
    }
}