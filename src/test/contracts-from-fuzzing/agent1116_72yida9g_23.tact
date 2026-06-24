// deeply nested with optionals all around

struct LV3 {
    q: Bool?;
    w: Int?;
}

struct LV2 {
    inner: LV3?;
    f: String?;
}

struct LV1 {
    inner: LV2?;
}

contract DeepOpt {
    nest: LV1?;

    init() {
        self.nest = LV1{ inner: LV2{ inner: LV3{ q:null, w:42 }, f:null } };
    }
}