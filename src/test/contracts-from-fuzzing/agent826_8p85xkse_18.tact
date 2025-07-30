struct Info {
    email: String?;
    verified: Bool?;
}

contract TestContract {
    info: Info?;

    init() {
        self.info = Info{
            email: "fuzz@tact.test",
            verified: true
        };
    }
}
