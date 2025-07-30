struct Info {
    val: Int;
    name: String;
}

contract OptionalStructAssigned {
    data: Info?;

    init() {
        self.data = Info{
            val: 777,
            name: "hello"
        };
    }
}
