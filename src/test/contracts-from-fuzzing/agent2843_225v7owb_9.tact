struct Label {
    name: String;
    color: String;
}

struct User {
    id: Int;
    label: Label;
    alias: String?;
}

contract Test9 {
    user: User;

    init() {
        self.user = User{
            id: 5,
            label: Label{
                name: "admin",
                color: "red"
            },
            alias: null
        };
    }
}