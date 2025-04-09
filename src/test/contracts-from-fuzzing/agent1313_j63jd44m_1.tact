contract SingleNestedStruct {
    data: User;

    init() {
        self.data = User{
            id: 1,
            name: "Alice"
        };
    }
}

struct User {
    id: Int;
    name: String;
}