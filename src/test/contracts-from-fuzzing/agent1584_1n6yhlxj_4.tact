struct Info {
    label: String;
    maybe: Int?;
}

contract TestContract {
    info: Info = Info{ label: "hello", maybe: null };

    receive() {
        self.info = Info{ label: "world", maybe: 123 };
    }
}
