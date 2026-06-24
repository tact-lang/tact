struct Container {
    i: Int;
    s: String;
}

contract OptionStructOptional {
    cont: Container?;
    init() {
        self.cont = null;
    }
}