struct DeepS1 { x: Int }
struct DeepS2 { x1: DeepS1 }
struct DeepS3 { x2: DeepS2 }
struct DeepS4 { x3: DeepS3 }
struct DeepS5 { x4: DeepS4 }
struct DeepS6 { x5: DeepS5 }

contract Deep6Level {
    d: DeepS6;

    init() {
        self.d = DeepS6{
            x5: DeepS5{
                x4: DeepS4{
                    x3: DeepS3{
                        x2: DeepS2{
                            x1: DeepS1{ x:7 }
                        }
                    }
                }
            }
        };
    }
}