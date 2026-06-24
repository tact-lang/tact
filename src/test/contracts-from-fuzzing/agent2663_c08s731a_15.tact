struct Basic {
    num: Int;
    flag: Bool;
}

contract ManyOptionals {
    field1: Basic?;
    field2: Basic?;
    field3: Basic?;
    field4: Basic?;
    field5: Basic?;

    init() {
        self.field1 = null;
        self.field2 = null;
        self.field3 = null;
        self.field4 = null;
        self.field5 = null;
    }
}