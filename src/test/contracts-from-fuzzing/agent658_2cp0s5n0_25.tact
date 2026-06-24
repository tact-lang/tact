struct Named {
    number: Int;
    text: String;
    flag: Bool;
}

contract Punned {
    field: Named;

    init() {
        let number = 42;
        let text = "hi";
        let flag = true;
        self.field = Named{number, text, flag};
    }
}