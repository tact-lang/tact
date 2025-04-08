// Testing nested structs combined with optionals and default struct field values
struct Info {
    title: String = "Tact";
    count: Int = 0;
    flag: Bool?;
}

struct Envelope {
    meta: Info;
    payload: String?;
}

contract TestContract {
    env: Envelope;

    init() {
        self.env = Envelope{
            meta: Info{ flag: null },
            payload: "Hello",
        };
    }
}
