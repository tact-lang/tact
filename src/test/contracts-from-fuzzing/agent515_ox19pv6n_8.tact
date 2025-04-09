message(101) Info {
    a: Int = 7;
    b: String?; // default null
}

contract Test {
    info: Info = Info{};

    receive() {
        let _ = self.info.a;
    }
}