contract TestContract {
    bigstr: String;
    smallstr: String;
    yes: Bool;
    no: Bool;
    number: Int;

    init() {
        self.bigstr = "Hello World";
        self.smallstr = "x";
        self.yes = true;
        self.no = false;
        self.number = 123;
    }
}