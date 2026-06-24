struct DeepNested {
    inner: InnerLevel1;
}

struct InnerLevel1 {
    inner: InnerLevel2;
}

struct InnerLevel2 {
    inner: InnerLevel3;
}

struct InnerLevel3 {
    val: Int?;
}

contract DeepStorage {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: InnerLevel1{
                inner: InnerLevel2{
                    inner: InnerLevel3{
                        val: null
                    }
                }
            }
        };
    }
}
