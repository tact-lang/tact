struct Info {
    age: Int;
    name: String;
}

contract NestedInit {
    data: Info;

    init() {
        self.data = Info{
            age: 42,
            name: "Bob",
        };
    }
}