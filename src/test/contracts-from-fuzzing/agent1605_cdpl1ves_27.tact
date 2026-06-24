struct DeeplyNested1 { v: Int }
struct DeeplyNested2 { inner1: DeeplyNested1 }
struct DeeplyNested3 { inner2: DeeplyNested2 }
struct DeeplyNested4 { inner3: DeeplyNested3 }
struct DeeplyNested5 { inner4: DeeplyNested4 }

contract DeepStructTest {
    data: DeeplyNested5;

    init() {
        self.data = DeeplyNested5{
            inner4: DeeplyNested4{
                inner3: DeeplyNested3{
                    inner2: DeeplyNested2{
                        inner1: DeeplyNested1{
                            v: 99
                        }
                    }
                }
            }
        };
    }
}