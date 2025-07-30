struct Point { x: Int; y: Int; }

struct User {
    location: Point?;
    name: String;
}

contract UserContract {
    user: User;

    init() {
        self.user = User{ location:null, name:"Alex" };
    }

    receive() {
        let _ = self.user;
    }
}