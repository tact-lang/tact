struct Info {
    name: String = "";
    age: Int?;
    active: Bool = true;
}

contract Test {
    info: Info;

    init() {
        self.info = Info{
            age: null,
        };
    }
}