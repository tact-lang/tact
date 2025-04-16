struct Info {
    name: String;
    flag: Bool;
    age: Int?;
}

contract TestContract {
    info: Info;

    init() {
        self.info = Info{
            name: "John",
            flag: true,
            age: null
        };
    }
}