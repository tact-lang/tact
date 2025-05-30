struct SLevel3 {
    z: Bool?;
}

struct SLevel2 {
    y: Int;
    s3: SLevel3?;
}

struct SLevel1 {
    x: String;
    s2: SLevel2?;
}

contract DeepNestedOpt {
    data: SLevel1;

    init() {
        self.data = SLevel1{
            x: "start",
            s2: SLevel2{
                y: 22,
                s3: null,
            },
        };
    }
}