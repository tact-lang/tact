struct InnerLevel3 {
    deep: Int;
    flag: Bool?;
}

struct InnerLevel2 {
    next: InnerLevel3;
    optionalNext: InnerLevel3?;
}

struct InnerLevel1 {
    next: InnerLevel2;
    optionalNext: InnerLevel2?;
}

contract DeeplyNested {
    root: InnerLevel1;

    init() {
        self.root = InnerLevel1{
            next: InnerLevel2{
                next: InnerLevel3{ deep: 777, flag: null },
                optionalNext: null,
            },
            optionalNext: null,
        };
    }
}