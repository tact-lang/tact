struct Details {
    count: Int;
    enabled: Bool;
    note: String?;
}

struct Wrapper {
    id: Int;
    meta: Details;
}

contract TestContract {
    data: Wrapper = Wrapper{
        id: 1,
        meta: Details{
            count: 0,
            enabled: false,
            note: null,
        }
    };

    receive() {
        self.data = Wrapper{
            id: 42,
            meta: Details{
                count: 100,
                enabled: true,
                note: "hi",
            }
        };
    }
}
