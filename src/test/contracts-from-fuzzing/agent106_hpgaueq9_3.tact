// Struct with many nullable nested optional fields
struct InnerLevel { a: Int?; b: Bool?; c: String?; }
struct MidLevel { inner: InnerLevel?; flag: Bool; }

contract OptionalNest {
    data: MidLevel = MidLevel{ inner: null, flag: false };

    init() {
        self.data = MidLevel{
            inner: InnerLevel{ a: null, b: true, c: "abc" },
            flag: true
        };
    }

    receive() {}
}