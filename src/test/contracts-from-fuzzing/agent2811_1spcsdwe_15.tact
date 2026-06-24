struct Names {
    first: String;
    last: String;
}

contract StringFields {
    name: Names;

    init() {
        self.name = Names{first: "Ada", last: "Lovelace"};
    }
}