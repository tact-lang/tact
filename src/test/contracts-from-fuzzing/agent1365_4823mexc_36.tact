struct FewOptions {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract Optioned {
    data: FewOptions;

    init() {
        self.data = FewOptions{
            a: null,
            b: true,
            c: null,
        };
    }
}