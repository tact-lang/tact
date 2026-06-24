struct NestedStrings {
    name: String;
    nickname: String?;
    bio: String?;
}

contract TestContract(param: NestedStrings) {
    receive() {
        let _ = self.param;
    }
}