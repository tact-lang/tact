struct InnerData {
    info: String?;
    count: Int?;
}

struct Wrapper {
    wrapped: InnerData?;
    flag: Bool;
}

contract OptionalStructWrapper {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            wrapped: null,
            flag: false
        };
    }
}