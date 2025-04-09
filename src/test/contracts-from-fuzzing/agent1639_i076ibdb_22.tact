struct DeepSlice {
    sliceData: Slice? = null;
    flag: Bool = false;
}

struct MidSlice {
    deep: DeepSlice?;
    count: Int = 0;
}

struct TopSlice {
    mid: MidSlice?;
    name: String = "default";
}

contract TestContract {
    data: TopSlice;

    init() {
        self.data = TopSlice{
            mid: MidSlice{
                deep: DeepSlice{
                    sliceData: "hello".asComment().asSlice(),
                    flag: true
                },
                count: 5
            },
            name: "custom"
        };
    }
}