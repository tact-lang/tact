contract OverlappingNames {
    someField: Int;
    SomeField: String;
    SOMEFIELD: Bool;

    init() {
        self.someField = 1;
        self.SomeField = "s";
        self.SOMEFIELD = true;
    }
}