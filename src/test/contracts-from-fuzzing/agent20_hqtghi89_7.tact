struct User {
    score: Int?;
}

contract OptionalPrimitiveInStruct {
    u: User;

    init() {
        self.u = User{score: null};
    }

    receive() {}
}
