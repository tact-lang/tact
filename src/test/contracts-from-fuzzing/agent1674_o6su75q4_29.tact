struct Detail {
    n: Int as uint8;
    label: String?;
    ok: Bool?;
}

struct Record {
    id: Int as uint32;
    active: Bool;
    meta: Detail;
}

contract NestedSerializedOptions {
    item: Record;

    init() {
        self.item = Record{
            id: 42,
            active: true,
            meta: Detail{
                n: 7,
                label: null,
                ok: null,
            },
        };
    }
}