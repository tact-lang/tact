struct Info {
    age: Int;
    note: String?;
}

contract InitAssign {
    data: Info;

    init() {
        self.data = Info{
            age: 33,
            note: null
        };
    }

    receive() {
        self.data = self.data;
    }
}