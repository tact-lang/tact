struct SubData {
    f1: Bool;
    f2: String;
}

contract DefaultAndNested {
    intVal: Int = 0;
    sub: SubData = SubData{ f1: true, f2: "zzz" };

    init() {
        self.intVal = 55;
        self.sub = SubData{ f1: false, f2: "abc" };
    }
}