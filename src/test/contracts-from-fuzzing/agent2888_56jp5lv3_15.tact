// nested structure with string and optional string
struct Inner {
    name: String?;
    greeting: String;
}

contract StringFields {
    data: Inner;

    init() {
        self.data = Inner{
            name: null,
            greeting: "hello",
        };
    }
}