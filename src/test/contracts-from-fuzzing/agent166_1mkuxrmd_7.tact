struct UserData {
    name: String;
    age: Int;
}

contract TestContract {
    maybeUser: UserData?;

    init() {
        self.maybeUser = null;
    }
}