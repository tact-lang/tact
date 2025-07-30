struct Alpha {
    s: String?;
    f: Bool?;
    n: Int?;
}

struct Beta {
    a1: Alpha?;
    a2: Alpha?;
}

contract DeepImplicitNulls {
    data: Beta;

    init() {
        self.data = Beta{
            a1: null,
            a2: Alpha{ s: "Hello", f: true, n: 17 },
        };
    }
}