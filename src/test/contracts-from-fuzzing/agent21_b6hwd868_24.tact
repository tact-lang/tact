struct DeepOptionalsLevel3 { x: Int? }
struct DeepOptionalsLevel2 { l3: DeepOptionalsLevel3? }
struct DeepOptionalsLevel1 { l2: DeepOptionalsLevel2? }

contract DeepOptionalTest {
    data: DeepOptionalsLevel1;

    init() {
        self.data = DeepOptionalsLevel1{
            l2: null
        };
    }
}