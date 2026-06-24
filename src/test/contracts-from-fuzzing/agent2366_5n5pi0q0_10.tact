struct Defaults {
    a: Int = 10;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
}

contract TestContract {
    defField: Defaults;

    init() {
        self.defField = Defaults{d:null};
    }
}