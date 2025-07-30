struct MixOptDepth1 {
    val: Int?;
    child: MixOptDepth2?;
}

struct MixOptDepth2 {
    flag: Bool?;
    inner: MixOptDepth3?;
}

struct MixOptDepth3 {
    text: String?;
}

contract MixedOptDeep {
    f: MixOptDepth1?;
    init() {
        self.f = MixOptDepth1{
            val: null,
            child: MixOptDepth2{
                flag: true,
                inner: null,
            },
        };
    }
}