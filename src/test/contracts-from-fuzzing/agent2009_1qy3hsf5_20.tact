struct DeepS1{a:Int;}
struct DeepS2{s:DeepS1;}
struct DeepS3{s:DeepS2;}
struct DeepS4{s:DeepS3;}
contract MoreLayers {
    f: DeepS4;
    init() {
        self.f = DeepS4{s:DeepS3{ s:DeepS2{ s:DeepS1{ a:42 }}}};
    }
}