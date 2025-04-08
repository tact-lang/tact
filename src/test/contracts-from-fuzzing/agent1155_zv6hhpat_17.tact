struct Triple {
    one: Int;
    two: Bool;
    three: String;
}

contract TestContract {
    primary: Triple;
    secondary: Triple?;

    init() {
        self.primary = Triple{one:1,two:true,three:"abc"};
        self.secondary = null;
    }
}