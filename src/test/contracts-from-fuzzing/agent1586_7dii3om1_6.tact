struct UserData {
    id: Int;
    name: String;
    isActive: Bool;
}

contract TestContract {
    data: UserData;

    init() {
        self.data = UserData{
            id: 1,
            name: "Alice",
            isActive: true,
        };
    }

    receive() {}
}