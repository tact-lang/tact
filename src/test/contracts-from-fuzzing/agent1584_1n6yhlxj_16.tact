struct Details {
    flag: Bool?;
    note: String?;
}

struct NestedOpt {
    meta: Details?;
}

contract TestContract {
    data: NestedOpt = NestedOpt{ meta: null };

    receive() {
        self.data = NestedOpt{
            meta: Details{
                flag: true,
                note: "hi"
            }
        };
    }
}
