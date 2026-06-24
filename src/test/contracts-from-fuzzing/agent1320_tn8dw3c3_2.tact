struct WithOptional {
    a: Int;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    data: WithOptional = WithOptional{ a: 42, b: null, c: null };

    receive() {
        self.data = WithOptional{ a: 1, b: true, c: "ok" };
    }
}