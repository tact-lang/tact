struct HugeOptPack {
    oa: Int?;
    ob: Bool?;
    oc: String?;
    od: Address?;
    oe: Int?;
    of: Bool?;
    og: String?;
    oh: Address?;
    oi: Int?;
    oj: Bool?;
    ok: String?;
    ol: Address?;
}

contract ManyOptionalsStorage {
    data: HugeOptPack;

    init() {
        self.data = HugeOptPack{
            oa: null, ob: null, oc: null, od: null,
            oe: null, of: null, og: null, oh: null,
            oi: null, oj: null, ok: null, ol: null
        };
    }
}