struct OneFieldOptional {
    val: Int?;
}

contract OptionalInit {
    state: OneFieldOptional;

    init() {
        self.state = OneFieldOptional{};  // no initializer; val defaults to null
    }

    receive() {
        if (self.state.val == null) {
            dump(0);
        } else {
            dump(self.state.val!!);
        }
    }
}