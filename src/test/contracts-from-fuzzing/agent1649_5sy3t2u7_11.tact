struct SubStruct {
    s: String;
    f: Bool;
    n: Int?;
}

contract ManyOptionals {
    os1: SubStruct?;
    os2: SubStruct?;
    os3: SubStruct?;

    init() {
        self.os1 = null;
        self.os2 = null;
        self.os3 = null;
    }
}