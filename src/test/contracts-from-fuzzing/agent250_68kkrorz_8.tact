struct B {
    s: String?;
    flag: Bool;
}

contract OptionalString {
    data: B;

    init() {
        self.data = B{s: null, flag: true};
    }
}