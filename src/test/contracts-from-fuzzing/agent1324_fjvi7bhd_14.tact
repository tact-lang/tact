struct Data {
    id: Int?;
    desc: String?;
}

contract OptStructExplicitNulls {
    data: Data?;

    init() {
        self.data = Data{
            id: null,
            desc: null,
        };
    }
}